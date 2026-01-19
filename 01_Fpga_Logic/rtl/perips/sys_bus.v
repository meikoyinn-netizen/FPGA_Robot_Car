`timescale 1ns / 1ps

module sys_bus(
    // ===========================================
    // Master: RISC-V CPU
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

    // --- Slave 3: UART (0x3000_0000) [新增] ---
    input  wire [31:0] uart_rdata, // 比如读取串口忙闲状态 (busy)
    output wire        uart_wen    // 比如写入发送数据 (start)
);

    // ===========================================
    // 地址地图 (Memory Map)
    // ===========================================
    localparam ADDR_DMEM = 4'h1; 
    localparam ADDR_GPIO = 4'h2;
    localparam ADDR_UART = 4'h3; // 预留给串口

    // 取出地址高4位用于片选
    wire [3:0] addr_head = cpu_addr[31:28];

    // ===========================================
    // 1. 写使能分发 (Write Logic)
    // ===========================================
    assign dmem_wen = cpu_wen && (addr_head == ADDR_DMEM);
    assign gpio_wen = cpu_wen && (addr_head == ADDR_GPIO);
    assign uart_wen = cpu_wen && (addr_head == ADDR_UART); // 命中0x3开头且写使能=1

    // ===========================================
    // 2. 读数据多路选择 (Read Logic)
    // ===========================================
    always @(*) begin
        case (addr_head)
            ADDR_DMEM: cpu_rdata = dmem_rdata;
            ADDR_GPIO: cpu_rdata = gpio_rdata;
            ADDR_UART: cpu_rdata = uart_rdata; // 读串口状态
            default:   cpu_rdata = 32'h0;      // 空地址返回0
        endcase
    end

endmodule