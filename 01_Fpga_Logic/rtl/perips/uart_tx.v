`timescale 1ns / 1ps
module uart_tx #(
    parameter integer CLK_FREQ  = 50_000_000,
    parameter integer BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] tx_data,
    input  wire       tx_start,   // 1-cycle pulse
    output wire       tx_busy,
    output reg        tx_pin
);
    // -------- clog2 for pure Verilog --------
    function integer clog2;
        input integer value;
        integer i;
        begin
            clog2 = 0;
            for (i = value - 1; i > 0; i = i >> 1)
                clog2 = clog2 + 1;
        end
    endfunction

    localparam integer BAUD_DIV   = (CLK_FREQ / BAUD_RATE);
    localparam integer BAUD_W     = (BAUD_DIV <= 1) ? 1 : clog2(BAUD_DIV);

    reg [BAUD_W-1:0] baud_cnt;
    reg [3:0]        bit_idx;      // 0..9
    reg [9:0]        shifter;      // {stop,data[7:0],start}
    reg              busy;

    assign tx_busy = busy;

    wire baud_tick = (baud_cnt == (BAUD_DIV-1));

    // baud counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_cnt <= {BAUD_W{1'b0}};
        end else if (busy) begin
            if (baud_tick) baud_cnt <= {BAUD_W{1'b0}};
            else           baud_cnt <= baud_cnt + {{(BAUD_W-1){1'b0}},1'b1};
        end else begin
            baud_cnt <= {BAUD_W{1'b0}};
        end
    end

    // tx state machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            busy    <= 1'b0;
            bit_idx <= 4'd0;
            shifter <= 10'b1111111111;
            tx_pin  <= 1'b1; // idle high
        end else begin
            if (!busy) begin
                tx_pin <= 1'b1;
                if (tx_start) begin
                    // load frame: start(0) + data + stop(1)
                    shifter <= {1'b1, tx_data, 1'b0};
                    busy    <= 1'b1;
                    bit_idx <= 4'd0;
                end
            end else begin
                if (baud_tick) begin
                    tx_pin  <= shifter[0];
                    shifter <= {1'b1, shifter[9:1]}; // shift right, keep stop as 1 fill
                    bit_idx <= bit_idx + 4'd1;

                    if (bit_idx == 4'd9) begin
                        busy    <= 1'b0;
                        bit_idx <= 4'd0;
                    end
                end
            end
        end
    end

endmodule
