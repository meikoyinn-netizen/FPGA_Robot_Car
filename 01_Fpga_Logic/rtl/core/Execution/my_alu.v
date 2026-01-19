`timescale 1ns / 1ps
module my_alu(
    input  wire [31:0] operand_a,
    input  wire [31:0] operand_b,
    input  wire [3:0]  alu_ctrl,
    output reg  [31:0] result_o,
    output wire        zero_o     // 【必须有这个端口】
);

    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b1000;
    localparam ALU_AND = 4'b0111;
    localparam ALU_OR  = 4'b0110;
    localparam ALU_XOR = 4'b0100;
    localparam ALU_SLL = 4'b0001;
    localparam ALU_SRL = 4'b0101;

    always @(*) begin
        case (alu_ctrl)
            ALU_ADD: result_o = operand_a + operand_b;
            ALU_SUB: result_o = operand_a - operand_b;
            ALU_AND: result_o = operand_a & operand_b;
            ALU_OR:  result_o = operand_a | operand_b;
            ALU_XOR: result_o = operand_a ^ operand_b;
            ALU_SLL: result_o = operand_a << operand_b[4:0];
            ALU_SRL: result_o = operand_a >> operand_b[4:0];
            default: result_o = 32'b0;
        endcase
    end

    // 结果为 0 时，zero_o 输出 1
    assign zero_o = (result_o == 32'b0) ? 1'b1 : 1'b0;
endmodule