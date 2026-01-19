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
    output reg         mem_to_reg_o
);

    assign opcode_o = inst_i[6:0];
    assign rd_o     = inst_i[11:7];
    assign func3_o  = inst_i[14:12];
    assign rs1_o    = inst_i[19:15];
    assign rs2_o    = inst_i[24:20];
    assign func7_o  = inst_i[31:25];
    wire func7_bit30 = inst_i[30];

    // opcode
    localparam OPCODE_R_TYPE   = 7'b0110011; // ADD/SUB
    localparam OPCODE_I_ALU    = 7'b0010011; // ADDI/SLLI (可扩展 ANDI 等)
    localparam OPCODE_I_LOAD   = 7'b0000011; // LW
    localparam OPCODE_S_STORE  = 7'b0100011; // SW
    localparam OPCODE_B_BRANCH = 7'b1100011; // BEQ

    // ALU ctrl（需与 my_alu.v 一致）
    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b1000;
    localparam ALU_SLL = 4'b0001;

    // 立即数默认生成（组合）
    always @(*) begin
        // --------- 关键：默认值，避免锁存 ----------
        imm_o = 32'b0;

        case (opcode_o)
            OPCODE_I_ALU,
            OPCODE_I_LOAD: begin
                imm_o = {{20{inst_i[31]}}, inst_i[31:20]};
                // SLLI: shamt=inst[24:20]，零扩展
                if (opcode_o == OPCODE_I_ALU && func3_o == 3'b001) begin
                    imm_o = {27'b0, inst_i[24:20]};
                end
            end

            OPCODE_S_STORE: begin
                imm_o = {{20{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
            end

            OPCODE_B_BRANCH: begin
                imm_o = {{20{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
            end

            default: begin
                imm_o = 32'b0;
            end
        endcase
    end

    // 控制信号 + ALU op（组合）
    always @(*) begin
        // --------- 关键：所有输出先默认清零 ----------
        reg_write_o  = 1'b0;
        alu_src_o    = 1'b0;
        branch_o     = 1'b0;
        mem_write_o  = 1'b0;
        mem_to_reg_o = 1'b0;
        alu_op_o     = ALU_ADD;

        case (opcode_o)
            OPCODE_R_TYPE: begin
                reg_write_o = 1'b1;
                alu_src_o   = 1'b0;

                // ADD / SUB
                if (func3_o == 3'b000 && func7_bit30) alu_op_o = ALU_SUB;
                else                                   alu_op_o = ALU_ADD;
            end

            OPCODE_I_ALU: begin
                reg_write_o = 1'b1;
                alu_src_o   = 1'b1;

                // ADDI / SLLI
                if (func3_o == 3'b001) alu_op_o = ALU_SLL; // SLLI
                else                   alu_op_o = ALU_ADD; // ADDI（也覆盖 NOP=ADDI x0,x0,0）
            end

            OPCODE_I_LOAD: begin
                reg_write_o  = 1'b1;
                alu_src_o    = 1'b1;
                mem_to_reg_o = 1'b1;
                alu_op_o     = ALU_ADD;
            end

            OPCODE_S_STORE: begin
                reg_write_o = 1'b0;
                alu_src_o   = 1'b1;
                mem_write_o = 1'b1;
                alu_op_o    = ALU_ADD;
            end

            OPCODE_B_BRANCH: begin
                branch_o = 1'b1;
                alu_src_o = 1'b0;
                alu_op_o  = ALU_SUB; // BEQ 用减法看 zero
            end

            default: begin
                // 保持默认全 0：尤其 mem_write_o 必须为 0
            end
        endcase
    end

endmodule
