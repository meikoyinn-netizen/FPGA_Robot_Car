`timescale 1ns / 1ps

module uart_mmio #(
    parameter integer FIFO_DEPTH = 16,  // 必须是2的幂：16/32/64...
    parameter integer FIFO_AW    = 4    // log2(FIFO_DEPTH): 16->4
)(
    input  wire        clk,
    input  wire        rst_n,

    input  wire        bus_valid,
    input  wire        bus_wen,
    input  wire [31:0] bus_wdata,
    input  wire [31:0] bus_addr,
    output wire        uart_ready,

    output wire        req_valid,
    output wire [7:0]  req_data,
    input  wire        req_accept,

    input  wire        tx_busy,
    output wire [31:0] mmio_rdata
);

    localparam UART_TXDATA = 2'b00;
    localparam UART_STATUS = 2'b01;
    wire [1:0] addr_word = bus_addr[3:2];

    // FIFO
    reg [7:0] fifo_mem [0:FIFO_DEPTH-1];
    reg [FIFO_AW-1:0] wr_ptr, rd_ptr;
    reg [FIFO_AW:0]   count;

    wire fifo_full  = (count == FIFO_DEPTH);
    wire fifo_empty = (count == 0);

    wire write_txdata = bus_valid && bus_wen && (addr_word == UART_TXDATA);
    assign uart_ready = write_txdata ? (!(fifo_full || tx_busy)) : 1'b1;
    wire write_fire = write_txdata && uart_ready;

    // 入队（只在上升沿）
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= {FIFO_AW{1'b0}};
        end else if (write_fire) begin
            fifo_mem[wr_ptr] <= bus_wdata[7:0];
            wr_ptr <= wr_ptr + 1'b1;
        end
    end

    // 出队
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr <= {FIFO_AW{1'b0}};
        end else if (req_accept && !fifo_empty) begin
            rd_ptr <= rd_ptr + 1'b1;
        end
    end

    // 计数
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= {(FIFO_AW+1){1'b0}};
        end else begin
            case ({write_fire, (req_accept && !fifo_empty)})
                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;
                default: count <= count;
            endcase
        end
    end

    assign req_valid = !fifo_empty;
    assign req_data  = fifo_mem[rd_ptr];

    // bit0=tx_busy, bit1=empty, bit2=full, [15:8]=count(补零到8位)
    wire [31:0] status_rdata = {16'b0, {3'b0, count}, 5'b0, fifo_full, fifo_empty, tx_busy};
    assign mmio_rdata = (addr_word == UART_STATUS) ? status_rdata : 32'b0;

endmodule
