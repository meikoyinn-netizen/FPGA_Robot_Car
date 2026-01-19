`timescale 1ns / 1ps
module gpio(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        wen,
    input  wire [31:0] wdata,
    output reg  [31:0] rdata,
    output reg  [7:0]  gpio_out
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            gpio_out <= 8'h00;
        end else if (wen) begin
            gpio_out <= wdata[7:0];
        end
    end

    always @(*) begin
        rdata = {24'b0, gpio_out};
    end
endmodule
