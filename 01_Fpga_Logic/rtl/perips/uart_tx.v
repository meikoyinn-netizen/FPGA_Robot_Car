`timescale 1ns / 1ps

module uart_tx #(
    parameter CLK_FREQ  = 50000000, // 默认 50MHz
    parameter BAUD_RATE = 115200    // 默认波特率
) (
    input  wire       clk,
    input  wire       rst_n,
    // === 关键：这里定义了 data_i 和 en_i ===
    input  wire [7:0] data_i,   
    input  wire       en_i,     
    output reg        tx_pin,
    output wire       busy_o
);

    // 计算分频系数
    localparam CNT_MAX = CLK_FREQ / BAUD_RATE;

    reg [15:0] cnt;
    reg [3:0]  bit_idx;
    reg [8:0]  shifter; // 包含: 停止位(1) + 数据(8)
    reg        state;   // 0: 空闲, 1: 发送中

    assign busy_o = state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt     <= 0;
            bit_idx <= 0;
            shifter <= 0;
            state   <= 0;
            tx_pin  <= 1; // 串口空闲时为高电平
        end else begin
            case (state)
                0: begin // IDLE 状态
                    if (en_i) begin
                        state   <= 1;
                        cnt     <= 0;
                        bit_idx <= 0;
                        shifter <= {1'b1, data_i}; // 准备移位的数据
                        tx_pin  <= 0;              // 发送起始位 (Start Bit = 0)
                    end else begin
                        tx_pin  <= 1;
                    end
                end

                1: begin // SEND 状态
                    if (cnt < CNT_MAX - 1) begin
                        cnt <= cnt + 1;
                    end else begin
                        cnt <= 0;
                        // 移位输出
                        tx_pin  <= shifter[0];
                        shifter <= {1'b1, shifter[8:1]};
                        
                        if (bit_idx < 9) begin
                            bit_idx <= bit_idx + 1;
                        end else begin
                            state <= 0; // 发送完成，回到 IDLE
                        end
                    end
                end
            endcase
        end
    end
endmodule