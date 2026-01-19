`timescale 1ns / 1ps

module riscv_top(
    input  wire        clk,
    input  wire        rst_n,

    output wire [31:0] mem_addr_o,
    output wire [31:0] mem_wdata_o,
    output wire        mem_wen_o,
    input  wire [31:0] mem_rdata_i,

    output wire [31:0] pc_debug
);

    wire [31:0] pc_wire;
    wire [31:0] inst_wire;

    wire [6:0]  opcode_wire;
    wire [4:0]  rd_idx;
    wire [2:0]  func3_wire;
    wire [6:0]  func7_wire;
    wire [4:0]  rs1_idx;
    wire [4:0]  rs2_idx;

    wire [31:0] imm_wire;
    wire [3:0]  alu_ctrl;

    wire reg_write_ctrl;
    wire alu_src_ctrl;
    wire branch_ctrl;
    wire mem_write_ctrl;
    wire mem_to_reg_ctrl;

    wire [31:0] rs1_data, rs2_data;
    wire [31:0] alu_res;
    wire        zero_flag;

    wire do_branch = branch_ctrl & zero_flag;
    wire [31:0] jump_target = pc_wire + imm_wire;

    wire [31:0] wb_data = mem_to_reg_ctrl ? mem_rdata_i : alu_res;

    my_pc_reg u_pc (
        .clk      (clk),
        .rst_n    (rst_n),
        .stall    (1'b0),
        .jump_flag(do_branch),
        .jump_addr(jump_target),
        .pc       (pc_wire)
    );

    my_imem u_imem (
        .addr(pc_wire),
        .inst(inst_wire)
    );

    my_decoder u_decoder (
        .inst_i       (inst_wire),

        .opcode_o     (opcode_wire),
        .rd_o         (rd_idx),
        .func3_o      (func3_wire),
        .func7_o      (func7_wire),
        .rs1_o        (rs1_idx),
        .rs2_o        (rs2_idx),

        .imm_o        (imm_wire),
        .alu_op_o     (alu_ctrl),

        .reg_write_o  (reg_write_ctrl),
        .alu_src_o    (alu_src_ctrl),
        .branch_o     (branch_ctrl),
        .mem_write_o  (mem_write_ctrl),
        .mem_to_reg_o (mem_to_reg_ctrl)
    );

    my_regfile u_regfile (
        .clk        (clk),
        .we_i       (reg_write_ctrl),

        .rs1_addr_i (rs1_idx),
        .rs1_data_o (rs1_data),

        .rs2_addr_i (rs2_idx),
        .rs2_data_o (rs2_data),

        .rd_addr_i  (rd_idx),
        .rd_data_i  (wb_data)
    );

    my_alu u_alu (
        .operand_a (rs1_data),
        .operand_b (alu_src_ctrl ? imm_wire : rs2_data),
        .alu_ctrl  (alu_ctrl),
        .result_o  (alu_res),
        .zero_o    (zero_flag)
    );

    // ========= 关键：STORE 才允许写 =========
    wire [6:0] op = inst_wire[6:0];
    wire is_store  = (op == 7'b0100011); // STORE

    assign mem_addr_o  = alu_res;
    assign mem_wdata_o = rs2_data;
    assign mem_wen_o   = mem_write_ctrl & is_store;

    assign pc_debug = pc_wire;

endmodule
