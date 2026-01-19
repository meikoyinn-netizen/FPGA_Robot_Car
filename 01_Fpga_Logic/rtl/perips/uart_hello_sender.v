`timescale 1ns / 1ps
module uart_hello_sender(
    input  wire       clk,
    input  wire       rst_n,

    input  wire       tx_busy,     // from uart_tx
    output reg        hello_valid, // request to send one byte
    output reg [7:0]  hello_data,
    input  wire       hello_accept // 该字节已经被真正送入 uart_tx（1-cycle）
);
    // "Hello\r\n"
    localparam integer N = 7;
    reg [2:0] idx;
    reg       active;

    function [7:0] rom;
        input [2:0] i;
        begin
            case (i)
                3'd0: rom = "H";
                3'd1: rom = "e";
                3'd2: rom = "l";
                3'd3: rom = "l";
                3'd4: rom = "o";
                3'd5: rom = 8'h0D; // \r
                3'd6: rom = 8'h0A; // \n
                default: rom = 8'h00;
            endcase
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            idx        <= 3'd0;
            active     <= 1'b1; // reset release后开始发
            hello_valid<= 1'b0;
            hello_data <= 8'h00;
        end else begin
            // 默认不拉高，只有需要发时拉高
            hello_valid <= 1'b0;

            if (active) begin
                if (!tx_busy) begin
                    hello_data  <= rom(idx);
                    hello_valid <= 1'b1;
                end

                if (hello_valid && hello_accept) begin
                    if (idx == (N-1)) begin
                        active <= 1'b0;  // 发完停止（你想循环就把这里改成 idx<=0）
                        idx    <= 3'd0;
                    end else begin
                        idx <= idx + 3'd1;
                    end
                end
            end
        end
    end

endmodule
