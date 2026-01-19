`timescale 1ns / 1ps

module riscv_top(
    input  wire        clk,
    input  wire        rst_n,
    // 为了方便仿真观察，我们把一些内部信号引出到顶层端口
    output wire [31:0] pc_debug,
    output wire [31:0] inst_debug,
    output wire [31:0] imm_debug
);

    // --- 内部连线 ---
    wire [31:0] pc_wire;
    wire [31:0] inst_wire;

    // 1. 实例化 PC 寄存器
    my_pc_reg u_pc (
        .clk(clk),
        .rst_n(rst_n),
        .stall(1'b0),        // 暂时给0
        .jump_flag(1'b0),    // 暂时给0
        .jump_addr(32'b0),
        .pc_o(pc_wire)
    );

    // 2. 实例化指令存储器 IMEM
    my_imem u_imem (
        .addr(pc_wire),
        .inst(inst_wire)
    );

    // 3. 实例化译码器 Decoder
    my_decoder u_decoder (
        .inst_i(inst_wire),
        .imm_o(imm_debug),   // 连到输出端口方便观察
        .opcode_o(),         // 以下信号后续连 RegFile 时再用
        .rd_o(),
        .func3_o(),
        .func7_o(),
        .rs1_o(),
        .rs2_o()
    );

    // 调试赋值
    assign pc_debug = pc_wire;
    assign inst_debug = inst_wire;

endmodule