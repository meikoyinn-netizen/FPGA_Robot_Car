`timescale 1ns / 1ps

module my_decoder(
    input  wire [31:0] inst_i,

    output wire [6:0]  opcode_o,
    output wire [4:0]  rd_o,
    output wire [2:0]  func3_o,
    output wire [6:0]  func7_o,
    output wire [4:0]  rs1_o,
    output wire [4:0]  rs2_o,

    output reg  [31:0] imm_o,
    output reg  [3:0]  alu_op_o,

    output reg         reg_write_o,
    output reg         alu_src_o,
    output reg         branch_o,
    output reg         mem_write_o,
    output reg         mem_to_reg_o,
    
    // ★★★ 新增端口：跳转控制 ★★★
    output reg         jump_o,  // 是否是跳转指令 (JAL/JALR)
    output reg         jalr_o   // 是否是 JALR (用于计算跳转地址来源)
);

    assign opcode_o = inst_i[6:0];
    assign rd_o     = inst_i[11:7];
    assign func3_o  = inst_i[14:12];
    assign rs2_o    = inst_i[24:20];
    assign func7_o  = inst_i[31:25];
    wire func7_bit30 = inst_i[30];

    // Opcode 定义
    localparam OPCODE_R_TYPE   = 7'b0110011;
    localparam OPCODE_I_ALU    = 7'b0010011;
    localparam OPCODE_I_LOAD   = 7'b0000011;
    localparam OPCODE_S_STORE  = 7'b0100011;
    localparam OPCODE_B_BRANCH = 7'b1100011;
    localparam OPCODE_U_LUI    = 7'b0110111;
    localparam OPCODE_U_AUIPC  = 7'b0010111;
    // 新增跳转指令
    localparam OPCODE_J_JAL    = 7'b1101111;
    localparam OPCODE_I_JALR   = 7'b1100111;

    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b1000;
    localparam ALU_SLL = 4'b0001;

    // 强制 rs1 为 0 的逻辑 (LUI/AUIPC/JAL)
    // JAL 也没有 rs1，强制为 0
    assign rs1_o = ((opcode_o == OPCODE_U_LUI) || (opcode_o == OPCODE_U_AUIPC) || (opcode_o == OPCODE_J_JAL)) ? 5'b0 : inst_i[19:15];

    always @(*) begin
        // 默认值
        reg_write_o  = 1'b0;
        alu_src_o    = 1'b0;
        branch_o     = 1'b0;
        mem_write_o  = 1'b0;
        mem_to_reg_o = 1'b0;
        alu_op_o     = ALU_ADD;
        imm_o        = 32'b0;
        jump_o       = 1'b0; // 默认不跳转
        jalr_o       = 1'b0; // 默认不是 JALR

        case (opcode_o)
            OPCODE_R_TYPE: begin
                reg_write_o = 1'b1;
                if (func3_o == 3'b000 && func7_bit30) alu_op_o = ALU_SUB;
                else                                  alu_op_o = ALU_ADD;
            end

            OPCODE_I_ALU: begin
                reg_write_o = 1'b1;
                alu_src_o   = 1'b1;
                imm_o = {{20{inst_i[31]}}, inst_i[31:20]};
                if (func3_o == 3'b001) alu_op_o = ALU_SLL;
                else                   alu_op_o = ALU_ADD;
            end

            OPCODE_I_LOAD: begin
                reg_write_o  = 1'b1;
                alu_src_o    = 1'b1;
                mem_to_reg_o = 1'b1;
                imm_o        = {{20{inst_i[31]}}, inst_i[31:20]};
            end

            OPCODE_S_STORE: begin
                mem_write_o = 1'b1;
                alu_src_o   = 1'b1;
                imm_o       = {{20{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
            end

            OPCODE_B_BRANCH: begin
                branch_o  = 1'b1;
                alu_op_o  = ALU_SUB; // 用于比较
                // B-Type 立即数
                imm_o     = {{20{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
            end

            OPCODE_U_LUI, OPCODE_U_AUIPC: begin
                reg_write_o = 1'b1;
                alu_src_o   = 1'b1;
                imm_o       = {inst_i[31:12], 12'b0};
            end

            // ★★★ 修复 JAL ★★★
            OPCODE_J_JAL: begin
                reg_write_o = 1'b1;
                alu_src_o   = 1'b1; 
                jump_o      = 1'b1;
                // J-Type 立即数
                imm_o = {{12{inst_i[31]}}, inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};
            end

            // ★★★ 修复 JALR ★★★
            OPCODE_I_JALR: begin
                reg_write_o = 1'b1;
                alu_src_o   = 1'b1;
                jump_o      = 1'b1;
                jalr_o      = 1'b1; // 标记为 JALR
                imm_o = {{20{inst_i[31]}}, inst_i[31:20]};
            end

            default: begin end
        endcase
    end
endmodule