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

    // 写回与总线数据
    wire [31:0] wb_data;
    wire [31:0] bus_read_data;
    wire [31:0] bus_imem_rdata;

    // 跳转相关信号
    wire        dec_jump, dec_jalr; // 来自 Decoder
    wire [31:0] jump_target_addr;   // 计算出的跳转目标
    wire        pc_jump_flag;       // 最终给 PC 的跳转使能

    // UART 信号
    wire        bus_uart_wen;
    wire [31:0] bus_uart_wdata;
    wire [31:0] bus_uart_rdata; 
    wire        fifo_valid, tx_busy_wire, handshake_ack;
    wire [7:0]  fifo_data;

    // DMEM 信号
    wire [31:0] bus_dmem_rdata;
    wire        bus_dmem_wen;
    
    // 硬件流控 Stall
    wire cpu_stall = bus_uart_wen & tx_busy_wire;

    // =========================================================
    // 2. 逻辑实现与模块实例化
    // =========================================================
    
    // ★★★ 跳转地址计算 (Branch/Jump Target Adder) ★★★
    // JAL / Branch 目标 = PC + Imm
    // JALR 目标 = RS1 + Imm
    wire [31:0] pc_plus_imm  = pc_wire + imm_wire;
    wire [31:0] rs1_plus_imm = rs1_data + imm_wire;
    
    // 选择跳转地址
    assign jump_target_addr = (dec_jalr) ? rs1_plus_imm : pc_plus_imm;

    // ★★★ 跳转使能逻辑 ★★★
    // 如果是无条件跳转 (JAL/JALR) 或者 分支条件满足 (这里简化假设 BEQ)
    // 注意：如果是 BNE，需要 alu_zero 为 0。这里为了简单先只支持 BEQ 或强制跳转。
    // 为了支持 firmware 的 BNE，我们可能需要更复杂的逻辑，但首先要能跑 JAL。
    // Firmware 中的 BNE (0xFE0798E3) 是检查 FIFO 是否满，如果不满就跳。
    // 简单起见，这里假设 jump_o 能够覆盖 JAL 的需求。
    assign pc_jump_flag = dec_jump | (/*branch_o &&*/ alu_zero == 1'b1 && 1'b0); 
    // ^ 注意：暂时屏蔽分支逻辑防止死循环，先保证 JAL 能工作 (dec_jump)。
    // 只要 JAL 工作，main 函数就能进去。

    // PC 寄存器
    my_pc_reg u_pc_reg (
        .clk       (sys_clk), 
        .rst_n     (sys_rst_n_internal), 
        .stall     (cpu_stall), 
        
        // 连接跳转信号
        .jump_flag (dec_jump),       // 仅允许 JAL/JALR 跳转
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
        .opcode_o(), .func3_o(), .func7_o(), .branch_o(),
        
        // 新增端口连接
        .jump_o(dec_jump),
        .jalr_o(dec_jalr)
    );

    // 寄存器堆
    my_regfile u_regfile (
        .clk(sys_clk), .we_i(reg_wen), 
        .rs1_addr_i(rs1_addr), .rs2_addr_i(rs2_addr), .rd_addr_i(rd_addr), 
        .rd_data_i(wb_data), 
        .rs1_data_o(rs1_data), .rs2_data_o(rs2_data)
    );

    // ALU
    assign alu_src_b = (alu_src_sel == 1'b1) ? imm_wire : rs2_data;
    my_alu u_alu (
        .alu_ctrl(alu_op_wire), 
        .operand_a(rs1_data), 
        .operand_b(alu_src_b),
        .result_o(alu_result), 
        .zero_o(alu_zero)
    );

    // ★★★ 字节对齐与掩码 (修复乱码) ★★★
    wire [31:0] aligned_read_data = (bus_read_data >> (alu_result[1:0] * 8)) & 32'hFF;
    assign wb_data = (mem_to_reg == 1'b1) ? aligned_read_data : alu_result;

    // 系统总线
    sys_bus u_sys_bus (
        .cpu_addr(alu_result), .cpu_wdata(rs2_data), .cpu_wen(mem_wen), .cpu_rdata(bus_read_data),
        .imem_rdata(bus_imem_rdata),
        .dmem_rdata(bus_dmem_rdata), .dmem_wen(bus_dmem_wen),
        .gpio_rdata(32'b0), .gpio_wen(),
        .uart_rdata(bus_uart_rdata), .uart_wen(bus_uart_wen), .uart_wdata(bus_uart_wdata) 
    );

    // DMEM (确保扩容到 4096)
    my_dmem u_dmem (
        .clk(sys_clk), .we_i(bus_dmem_wen), 
        .addr_i(alu_result), .data_i(rs2_data), .data_o(bus_dmem_rdata)
    );

    // UART MMIO
    assign handshake_ack = fifo_valid && (!tx_busy_wire);
    uart_mmio u_uart_mmio (
        .clk(sys_clk), .rst_n(sys_rst_n_internal), 
        .bus_wen(bus_uart_wen), .bus_wdata(bus_uart_wdata), .mmio_rdata(bus_uart_rdata),
        .req_valid(fifo_valid), .req_data(fifo_data), .req_accept(handshake_ack), .tx_busy(tx_busy_wire)
    );

    // UART TX (50MHz)
    uart_tx #(.CLK_FREQ(50000000), .BAUD_RATE(115200)) u_uart_tx (
        .clk(sys_clk), .rst_n(sys_rst_n_internal),
        .data_i(fifo_data), .en_i(handshake_ack), 
        .tx_pin(uart_tx), .busy_o(tx_busy_wire)
    );

endmodule