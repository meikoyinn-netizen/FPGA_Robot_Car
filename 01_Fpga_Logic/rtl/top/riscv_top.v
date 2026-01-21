`timescale 1ns / 1ps

module riscv_top(
    input  wire sys_clk,
    output wire uart_tx,
    output wire led
);

    // 0. 基础辅助信号
    reg [7:0] rst_cnt = 0;
    wire      sys_rst_n_internal = (rst_cnt == 8'hFF);
    always @(posedge sys_clk) if (rst_cnt != 8'hFF) rst_cnt <= rst_cnt + 1;

    reg [25:0] led_cnt = 0;
    always @(posedge sys_clk) led_cnt <= led_cnt + 1;
    assign led = led_cnt[25]; 

    // 1. 内部信号定义
    wire [31:0] pc_wire, inst_wire;
    wire [4:0]  rs1_addr, rs2_addr, rd_addr;
    wire [31:0] imm_wire, rs1_data, rs2_data, alu_src_b, alu_result;
    wire [3:0]  alu_op_wire;
    wire        reg_wen, mem_wen, alu_src_sel, mem_to_reg, alu_zero;
    wire [6:0]  opcode_wire;
    wire [2:0]  func3_wire;
    wire        branch_wire;

    // 写回与总线数据
    wire [31:0] wb_data;
    wire [31:0] bus_read_data;
    wire [31:0] bus_imem_rdata;
    wire [3:0]  cpu_wmask;
    wire [3:0]  dmem_wmask;
    wire [31:0] bus_write_data;

    // D-Bus 主接口抽象
    wire        dbus_valid;
    wire        dbus_ready;
    wire [31:0] dbus_addr;
    wire [31:0] dbus_wdata;
    wire [3:0]  dbus_wstrb;
    wire [31:0] dbus_rdata;
    wire        dbus_wait;

    // 跳转相关信号
    wire        dec_jump, dec_jalr; // 来自 Decoder
    wire [31:0] jump_target_addr;   // 计算出的跳转目标
    wire        pc_jump_flag;       // 最终给 PC 的跳转使能
    wire [31:0] pc_plus_4 = pc_wire + 32'd4;

    // UART 信号
    wire        bus_uart_wen;
    wire [31:0] bus_uart_wdata;
    wire [31:0] bus_uart_rdata; 
    wire        bus_uart_ready;
    wire        fifo_valid, tx_busy_wire, handshake_ack;
    wire [7:0]  fifo_data;

    // DMEM 信号
    wire [31:0] bus_dmem_rdata;
    wire        bus_dmem_wen;
    
    // 硬件流控 Stall
    assign dbus_wait = dbus_valid && !dbus_ready;

    // =========================================================
    // 2. 逻辑实现与模块实例化
    // =========================================================
    
    // ★★★ 跳转地址计算 (Branch/Jump Target Adder) ★★★
    // JAL / Branch 目标 = PC + Imm
    // JALR 目标 = RS1 + Imm
    wire [31:0] pc_plus_imm  = pc_wire + imm_wire;
    wire [31:0] rs1_plus_imm = rs1_data + imm_wire;
    
    // 选择跳转地址
    assign jump_target_addr = (dec_jalr) ? (rs1_plus_imm & 32'hFFFF_FFFE) : pc_plus_imm;

    // ★★★ 跳转使能逻辑 ★★★
    // 如果是无条件跳转 (JAL/JALR) 或者 分支条件满足 (这里简化假设 BEQ)
    // 注意：如果是 BNE，需要 alu_zero 为 0。这里为了简单先只支持 BEQ 或强制跳转。
    // 为了支持 firmware 的 BNE，我们可能需要更复杂的逻辑，但首先要能跑 JAL。
    // Firmware 中的 BNE (0xFE0798E3) 是检查 FIFO 是否满，如果不满就跳。
    // 简单起见，这里假设 jump_o 能够覆盖 JAL 的需求。
    wire branch_taken = branch_wire &&
        ((func3_wire == 3'b000 && alu_zero) || // BEQ
         (func3_wire == 3'b001 && !alu_zero)); // BNE
    assign pc_jump_flag = dec_jump | branch_taken; 

    // PC 寄存器
    my_pc_reg u_pc_reg (
        .clk       (sys_clk), 
        .rst_n     (sys_rst_n_internal), 
        .stall     (dbus_wait), 
        
        // 连接跳转信号
        .jump_flag (pc_jump_flag),       // 允许 JAL/JALR 与分支跳转
        .jump_addr (jump_target_addr), 
        
        .pc        (pc_wire)
    );

    // 指令存储器
    my_imem u_imem (
        .addr(pc_wire), .rdata(inst_wire),
        .data_addr(alu_result), .data_rdata(bus_imem_rdata)
    );

    // 译码器 (已连接跳转信号)
    my_decoder u_decoder (
        .inst_i(inst_wire), 
        .rd_o(rd_addr), .rs1_o(rs1_addr), .rs2_o(rs2_addr),
        .imm_o(imm_wire), .alu_op_o(alu_op_wire), 
        .reg_write_o(reg_wen), 
        .alu_src_o(alu_src_sel), 
        .mem_write_o(mem_wen), 
        .mem_to_reg_o(mem_to_reg), 
        .opcode_o(opcode_wire), .func3_o(func3_wire), .func7_o(), .branch_o(branch_wire),
        
        // 新增端口连接
        .jump_o(dec_jump),
        .jalr_o(dec_jalr)
    );

    // 寄存器堆
    my_regfile u_regfile (
        .clk(sys_clk), .we_i(reg_wen && !dbus_wait), 
        .rs1_addr_i(rs1_addr), .rs2_addr_i(rs2_addr), .rd_addr_i(rd_addr), 
        .rd_data_i(wb_data), 
        .rs1_data_o(rs1_data), .rs2_data_o(rs2_data)
    );

    // ALU
    localparam OPCODE_U_AUIPC = 7'b0010111;
    wire [31:0] alu_src_a = (opcode_wire == OPCODE_U_AUIPC) ? pc_wire : rs1_data;
    assign alu_src_b = (alu_src_sel == 1'b1) ? imm_wire : rs2_data;
    my_alu u_alu (
        .alu_ctrl(alu_op_wire), 
        .operand_a(alu_src_a), 
        .operand_b(alu_src_b),
        .result_o(alu_result), 
        .zero_o(alu_zero)
    );

    // ★★★ Load 数据对齐与扩展 ★★★
    wire [31:0] load_shifted = bus_read_data >> (alu_result[1:0] * 8);
    reg  [31:0] load_data;
    always @(*) begin
        case (func3_wire)
            3'b000: load_data = {{24{load_shifted[7]}}, load_shifted[7:0]};   // LB
            3'b001: load_data = {{16{load_shifted[15]}}, load_shifted[15:0]}; // LH
            3'b010: load_data = bus_read_data;                                // LW
            3'b100: load_data = {24'b0, load_shifted[7:0]};                    // LBU
            3'b101: load_data = {16'b0, load_shifted[15:0]};                   // LHU
            default: load_data = bus_read_data;
        endcase
    end

    // ★★★ Store 写入数据与字节使能 ★★★
    reg [31:0] store_data;
    reg [3:0]  store_mask;
    always @(*) begin
        store_data = rs2_data;
        store_mask = 4'b1111;
        case (func3_wire)
            3'b000: begin // SB
                store_data = {4{rs2_data[7:0]}};
                store_mask = 4'b0001 << alu_result[1:0];
            end
            3'b001: begin // SH
                store_data = {2{rs2_data[15:0]}};
                store_mask = alu_result[1] ? 4'b1100 : 4'b0011;
            end
            3'b010: begin // SW
                store_data = rs2_data;
                store_mask = 4'b1111;
            end
            default: begin
                store_data = rs2_data;
                store_mask = 4'b1111;
            end
        endcase
    end

    assign wb_data = mem_to_reg ? load_data : (dec_jump ? pc_plus_4 : alu_result);
    assign cpu_wmask = store_mask;

    // D-Bus 信号绑定
    assign dbus_valid = mem_wen || mem_to_reg;
    assign dbus_addr = alu_result;
    assign dbus_wdata = bus_write_data;
    assign dbus_wstrb = cpu_wmask;
    assign dbus_rdata = bus_read_data;

    // 系统总线
    sys_bus u_sys_bus (
        .cpu_addr(dbus_addr), .cpu_valid(dbus_valid), .cpu_wdata(dbus_wdata), .cpu_wmask(dbus_wstrb), .cpu_wen(mem_wen), .cpu_rdata(bus_read_data),
        .bus_ready(dbus_ready),
        .imem_rdata(bus_imem_rdata),
        .dmem_rdata(bus_dmem_rdata), .dmem_wen(bus_dmem_wen), .dmem_wmask(dmem_wmask),
        .gpio_rdata(32'b0), .gpio_wen(),
        .uart_rdata(bus_uart_rdata), .uart_ready(bus_uart_ready), .uart_wen(bus_uart_wen), .uart_wdata(bus_uart_wdata) 
    );

    // DMEM (确保扩容到 4096)
    assign bus_write_data = store_data;

    my_dmem u_dmem (
        .clk(sys_clk), .we_i(bus_dmem_wen), .wmask_i(dmem_wmask),
        .addr_i(alu_result), .data_i(bus_write_data), .data_o(bus_dmem_rdata)
    );

    // UART MMIO
    assign handshake_ack = fifo_valid && (!tx_busy_wire);
    uart_mmio u_uart_mmio (
        .clk(sys_clk), .rst_n(sys_rst_n_internal), 
        .bus_valid(dbus_valid), .bus_wen(bus_uart_wen), .bus_wdata(bus_uart_wdata), .bus_addr(dbus_addr), .uart_ready(bus_uart_ready),
        .mmio_rdata(bus_uart_rdata),
        .req_valid(fifo_valid), .req_data(fifo_data), .req_accept(handshake_ack), .tx_busy(tx_busy_wire)
    );

    // UART TX (50MHz)
    uart_tx #(.CLK_FREQ(50000000), .BAUD_RATE(115200)) u_uart_tx (
        .clk(sys_clk), .rst_n(sys_rst_n_internal),
        .data_i(fifo_data), .en_i(handshake_ack), 
        .tx_pin(uart_tx), .busy_o(tx_busy_wire)
    );

endmodule
