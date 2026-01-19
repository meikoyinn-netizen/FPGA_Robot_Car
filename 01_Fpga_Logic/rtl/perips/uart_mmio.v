`timescale 1ns / 1ps

module uart_mmio #(
    parameter integer FIFO_DEPTH = 16,  // 必须是2的幂：16/32/64...
    parameter integer FIFO_AW    = 4    // log2(FIFO_DEPTH): 16->4
)(
    input  wire        clk,
    input  wire        rst_n,

    // 来自 sys_bus：写寄存器触发发送
    input  wire        bus_wen,
    input  wire [31:0] bus_wdata,

    // 送给 uart_tx 的请求
    output wire        req_valid,
    output wire [7:0]  req_data,
    input  wire        req_accept,       // 顶层在真正 tx_start 时给一个脉冲

    input  wire        tx_busy,

    // 可选：读回状态
    output wire [31:0] mmio_rdata
);

    // ============================================================
    // 1) bus_wen 上升沿检测：只在上升沿“入队一次”
    //    防止 CPU 把 bus_wen 拉高保持多个周期导致重复入队刷屏
    // ============================================================
    reg bus_wen_d;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) bus_wen_d <= 1'b0;
        else        bus_wen_d <= bus_wen;
    end
    wire bus_wen_pulse = bus_wen & ~bus_wen_d;

    // ============================================================
    // 2) FIFO
    // ============================================================
    reg [7:0] fifo_mem [0:FIFO_DEPTH-1];
    reg [FIFO_AW-1:0] wr_ptr, rd_ptr;
    reg [FIFO_AW:0]   count;

    wire fifo_full  = (count == FIFO_DEPTH);
    wire fifo_empty = (count == 0);

    // 入队：只在 bus_wen 上升沿入队
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= {FIFO_AW{1'b0}};
        end else if (bus_wen_pulse && !fifo_full) begin
            fifo_mem[wr_ptr] <= bus_wdata[7:0];
            wr_ptr <= wr_ptr + 1'b1;
        end
    end

    // 出队：tx_fire 时 req_accept=1
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
            case ({(bus_wen_pulse && !fifo_full), (req_accept && !fifo_empty)})
                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;
                default: count <= count;
            endcase
        end
    end

    assign req_valid = !fifo_empty;
    assign req_data  = fifo_mem[rd_ptr];

    // 状态回读（可选用）
    // bit0=tx_busy, bit1=empty, bit2=full, [15:8]=count(补零到8位)
    assign mmio_rdata = {16'b0, {3'b0, count}, 5'b0, fifo_full, fifo_empty, tx_busy};

endmodule
