`timescale 1ns / 1ps

module fpga_top(
    input  wire sys_clk,       // J19
    input  wire sys_rst_n,      // AA1

    output wire led_heartbeat,  // M18

    output wire uart_tx_v2,     // V2
    output wire uart_tx_u2      // U2
);

    // ============================================================
    // 1) Heartbeat
    // ============================================================
    reg [25:0] hb_cnt;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) hb_cnt <= 26'd0;
        else            hb_cnt <= hb_cnt + 26'd1;
    end

    // 如果你板子 LED 是低电平点亮，想“闪烁”可以取反：~hb_cnt[25]
    assign led_heartbeat = hb_cnt[25];

    // ============================================================
    // 2) CPU -> bus master
    // ============================================================
    wire [31:0] bus_addr, bus_wdata, bus_rdata;
    wire        bus_wen;

    riscv_top u_cpu (
        .clk        (sys_clk),
        .rst_n      (sys_rst_n),

        .mem_addr_o (bus_addr),
        .mem_wdata_o(bus_wdata),
        .mem_wen_o  (bus_wen),
        .mem_rdata_i(bus_rdata),

        .pc_debug   ()
    );

    // ============================================================
    // 3) sys_bus decode
    // ============================================================
    wire        dmem_wen, gpio_wen, uart_wen;
    wire [31:0] dmem_rdata = 32'h0;
    wire [31:0] gpio_rdata = 32'h0;
    wire [31:0] uart_rdata;

    sys_bus u_bus (
        .cpu_addr  (bus_addr),
        .cpu_wdata (bus_wdata),
        .cpu_wen   (bus_wen),
        .cpu_rdata (bus_rdata),

        .dmem_rdata(dmem_rdata),
        .dmem_wen  (dmem_wen),

        .gpio_rdata(gpio_rdata),
        .gpio_wen  (gpio_wen),

        .uart_rdata(uart_rdata),
        .uart_wen  (uart_wen)
    );

    // ============================================================
    // 4) UART MMIO + UART TX
    // ============================================================
    wire tx_sig;
    wire tx_busy;

    wire       mmio_valid;   // FIFO 非空
    wire [7:0] mmio_data;    // FIFO 队头
    wire       mmio_accept;  // tx_fire 时弹出一个字节

    uart_mmio u_uart_mmio (
        .clk        (sys_clk),
        .rst_n      (sys_rst_n),

        .bus_wen    (uart_wen),
        .bus_wdata  (bus_wdata),

        .req_valid  (mmio_valid),
        .req_data   (mmio_data),
        .req_accept (mmio_accept),

        .tx_busy    (tx_busy),
        .mmio_rdata (uart_rdata)
    );

    // UART 空闲且 FIFO 非空 -> 发送一个字节，并同时出队
    wire tx_fire = (!tx_busy) && mmio_valid;
    assign mmio_accept = tx_fire;

    uart_tx #(
        .CLK_FREQ (50_000_000),
        .BAUD_RATE(115200)
    ) u_uart (
        .clk     (sys_clk),
        .rst_n   (sys_rst_n),
        .tx_data (mmio_data),
        .tx_start(tx_fire),
        .tx_busy (tx_busy),
        .tx_pin  (tx_sig)
    );

    assign uart_tx_v2 = tx_sig;
    assign uart_tx_u2 = tx_sig;

endmodule
