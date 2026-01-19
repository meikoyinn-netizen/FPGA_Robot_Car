`timescale 1ns / 1ps

module riscv_top(
    input  wire sys_clk,
    output wire uart_tx,
    output wire led
);

    // =========================================================
    // 0. 基础辅助信号
    // =========================================================
    reg [7:0] rst_cnt = 0;
    wire      sys_rst_n_internal = (rst_cnt == 8'hFF);
    always @(posedge sys_clk) if (rst_cnt != 8'hFF) rst_cnt <= rst_cnt + 1;

    reg [25:0] led_cnt = 0;
    always @(posedge sys_clk) led_cnt <= led_cnt + 1;
    assign led = led_cnt[25]; 

    // =========================================================
    // 1. 内部信号
    // =========================================================
    wire [31:0] pc_wire, inst_wire;
    wire [4:0]  rs1_addr, rs2_addr, rd_addr;
    wire [31:0] imm_wire, rs1_data, rs2_data, alu_src_b, alu_result, wb_data;
    wire [3:0]  alu_op_wire;
    wire        reg_wen, mem_wen, alu_src_sel, mem_to_reg, alu_zero;
    
    wire        bus_uart_wen;
    wire [31:0] bus_uart_wdata, bus_uart_rdata;
    wire        fifo_valid, tx_busy_wire, handshake_ack;
    wire [7:0]  fifo_data;

    // ★★★ 关键修复：硬件流控信号 ★★★
    // 逻辑：如果 CPU 想要写串口(bus_uart_wen)，但是串口正忙(tx_busy_wire)，
    //       就强制拉高 stall 信号，让 CPU 停在这一行指令别动！
    wire cpu_stall = bus_uart_wen & tx_busy_wire;


    // =========================================================
    // 2. 模块实例化
    // =========================================================
    
    // PC 寄存器 (接入 stall 信号)
    my_pc_reg u_pc_reg (
        .clk       (sys_clk), 
        .rst_n     (sys_rst_n_internal), 
        .stall     (cpu_stall),   // <--- 这里接上了“刹车”！
        .jump_flag (1'b0),        // 暂时还不支持跳转，靠内存回绕循环
        .jump_addr (32'b0), 
        .pc        (pc_wire)
    );

    my_imem u_imem (.addr(pc_wire), .rdata(inst_wire));

    my_decoder u_decoder (
        .inst_i(inst_wire), .rd_o(rd_addr), .rs1_o(rs1_addr), .rs2_o(rs2_addr),
        .imm_o(imm_wire), .alu_op_o(alu_op_wire), .reg_write_o(reg_wen),
        .alu_src_o(alu_src_sel), .mem_write_o(mem_wen), .mem_to_reg_o(mem_to_reg),
        .opcode_o(), .func3_o(), .func7_o(), .branch_o()
    );

    my_regfile u_regfile (
        .clk(sys_clk), .we_i(reg_wen), .rs1_addr_i(rs1_addr), .rs2_addr_i(rs2_addr),
        .rd_addr_i(rd_addr), .rd_data_i(wb_data), .rs1_data_o(rs1_data), .rs2_data_o(rs2_data)
    );

    assign alu_src_b = (alu_src_sel == 1'b1) ? imm_wire : rs2_data;

    my_alu u_alu (
        .alu_ctrl(alu_op_wire), .operand_a(rs1_data), .operand_b(alu_src_b),
        .result_o(alu_result), .zero_o(alu_zero)
    );

    assign wb_data = alu_result; 

    // 总线
    sys_bus u_sys_bus (
        .cpu_addr(alu_result), .cpu_wdata(rs2_data), .cpu_wen(mem_wen), .cpu_rdata(),
        .dmem_rdata(32'b0), .dmem_wen(), .gpio_rdata(32'b0), .gpio_wen(),
        .uart_rdata(bus_uart_rdata), 
        .uart_wen(bus_uart_wen),    
        .uart_wdata(bus_uart_wdata) 
    );

    // 串口
    assign handshake_ack = fifo_valid && (!tx_busy_wire);

    uart_mmio u_uart_mmio (
        .clk(sys_clk), .rst_n(sys_rst_n_internal), 
        .bus_wen(bus_uart_wen), .bus_wdata(bus_uart_wdata), .mmio_rdata(bus_uart_rdata),
        .req_valid(fifo_valid), .req_data(fifo_data), .req_accept(handshake_ack), .tx_busy(tx_busy_wire)
    );

    uart_tx #(.CLK_FREQ(50000000), .BAUD_RATE(115200)) u_uart_tx (
        .clk(sys_clk), .rst_n(sys_rst_n_internal),
        .data_i(fifo_data), .en_i(handshake_ack), .tx_pin(uart_tx), .busy_o(tx_busy_wire)
    );

endmodule