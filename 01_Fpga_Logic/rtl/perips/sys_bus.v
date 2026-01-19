`timescale 1ns / 1ps

module sys_bus(
    // ===========================================
    // Master: RISC-V CPU 接口
    // ===========================================
    input  wire [31:0] cpu_addr,
    input  wire [31:0] cpu_wdata,
    input  wire        cpu_wen,
    output reg  [31:0] cpu_rdata,

    // ===========================================
    // Slaves: 外设接口
    // ===========================================

    // --- Slave 1: DMEM (0x1000_0000) ---
    input  wire [31:0] dmem_rdata,
    output wire        dmem_wen,

    // --- Slave 2: GPIO (0x2000_0000) ---
    input  wire [31:0] gpio_rdata,
    output wire        gpio_wen,

    // --- Slave 3: UART (0x3000_0000) ---
    input  wire [31:0] uart_rdata,
    output wire        uart_wen,
    output wire [31:0] uart_wdata  // 【必须加这行】把数据传给串口
);

    // ===========================================
    // 地址映射 (Memory Map)
    // ===========================================
    localparam ADDR_DMEM = 4'h1; // 0x1...
    localparam ADDR_GPIO = 4'h2; // 0x2...
    localparam ADDR_UART = 4'h3; // 0x3...

    // 取出地址高4位用于片选
    wire [3:0] addr_head = cpu_addr[31:28];

    // ===========================================
    // 1. 写使能分发 (Write Enable Distribution)
    // ===========================================
    assign dmem_wen = cpu_wen && (addr_head == ADDR_DMEM);
    assign gpio_wen = cpu_wen && (addr_head == ADDR_GPIO);
    assign uart_wen = cpu_wen && (addr_head == ADDR_UART);

    // ===========================================
    // 2. 写数据广播 (Data Broadcast)
    // ===========================================
    // 简单处理：所有外设都能收到写数据，只有 wen 拉高的才会真正写入
    assign uart_wdata = cpu_wdata; 

    // ===========================================
    // 3. 读数据多路选择 (Read Mux)
    // ===========================================
    always @(*) begin
        case (addr_head)
            ADDR_DMEM: cpu_rdata = dmem_rdata;
            ADDR_GPIO: cpu_rdata = gpio_rdata;
            ADDR_UART: cpu_rdata = uart_rdata;
            default:   cpu_rdata = 32'b0;
        endcase
    end

endmodule