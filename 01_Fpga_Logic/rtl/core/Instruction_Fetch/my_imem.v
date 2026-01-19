`timescale 1ns / 1ps
module my_imem(
    input  wire [31:0] addr,
    output reg  [31:0] inst
);
    always @(*) begin
        case (addr[9:2])
            // x1 = 0x30000000
            8'd0:  inst = 32'h30000093; // ADDI x1, x0, 0x300
            8'd1:  inst = 32'h01409093; // SLLI x1, x1, 20

            // "CPU OK\r\n" 只发一次
            8'd2:  inst = 32'h04300113; // 'C'
            8'd3:  inst = 32'h0020A023;

            8'd4:  inst = 32'h05000113; // 'P'
            8'd5:  inst = 32'h0020A023;

            8'd6:  inst = 32'h05500113; // 'U'
            8'd7:  inst = 32'h0020A023;

            8'd8:  inst = 32'h02000113; // ' '
            8'd9:  inst = 32'h0020A023;

            8'd10: inst = 32'h04F00113; // 'O'
            8'd11: inst = 32'h0020A023;

            8'd12: inst = 32'h04B00113; // 'K'
            8'd13: inst = 32'h0020A023;

            8'd14: inst = 32'h00D00113; // '\r'
            8'd15: inst = 32'h0020A023;

            8'd16: inst = 32'h00A00113; // '\n'
            8'd17: inst = 32'h0020A023;

            // 后面全是 NOP：程序“自然跑飞”也没关系，不再写 UART
            default: inst = 32'h00000013; // NOP
        endcase
    end
endmodule
