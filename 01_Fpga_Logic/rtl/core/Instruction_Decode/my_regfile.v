`timescale 1ns / 1ps

module my_regfile(
    input  wire        clk,
    input  wire        we_i,

    input  wire [4:0]  rs1_addr_i,
    output wire [31:0] rs1_data_o,

    input  wire [4:0]  rs2_addr_i,
    output wire [31:0] rs2_data_o,

    input  wire [4:0]  rd_addr_i,
    input  wire [31:0] rd_data_i
);
    reg [31:0] regs [0:31];

    // sync write
    always @(posedge clk) begin
        if (we_i && (rd_addr_i != 5'd0)) begin
            regs[rd_addr_i] <= rd_data_i;
        end
    end

    // async read
    assign rs1_data_o = (rs1_addr_i == 5'd0) ? 32'b0 : regs[rs1_addr_i];
    assign rs2_data_o = (rs2_addr_i == 5'd0) ? 32'b0 : regs[rs2_addr_i];

endmodule
