`timescale 1ns / 1ps
// NOTE: Keep this file containing only the sys_bus module to avoid duplicate definitions.

module sys_bus(
    // Master: CPU
    input  wire [31:0] cpu_addr,
    input  wire [31:0] cpu_wdata,
    input  wire [3:0]  cpu_wmask,
    input  wire        cpu_wen,
    output reg  [31:0] cpu_rdata,

    // ★★★ 关键修复 1: 必须定义这个输入端口 ★★★
    input  wire [31:0] imem_rdata,

    // Slave 1: DMEM
    input  wire [31:0] dmem_rdata,
    output wire        dmem_wen,
    output wire [3:0]  dmem_wmask,

    // Slave 2: GPIO
    input  wire [31:0] gpio_rdata,
    output wire        gpio_wen,

    // Slave 3: UART
    input  wire [31:0] uart_rdata,
    output wire        uart_wen,
    output wire [31:0] uart_wdata
);

    // 地址映射
    localparam ADDR_IMEM = 4'h0; // 0x0000_xxxx
    localparam ADDR_DMEM = 4'h1; // 0x1000_xxxx
    localparam ADDR_GPIO = 4'h2; // 0x2000_xxxx
    localparam ADDR_UART = 4'h3; // 0x3000_xxxx

    wire [3:0] addr_head = cpu_addr[31:28];

    // 写使能分发
    assign dmem_wen = cpu_wen && (addr_head == ADDR_DMEM);
    assign gpio_wen = cpu_wen && (addr_head == ADDR_GPIO);
    assign uart_wen = cpu_wen && (addr_head == ADDR_UART);

    // 写数据广播
    assign uart_wdata = cpu_wdata;
    assign dmem_wmask = (addr_head == ADDR_DMEM) ? cpu_wmask : 4'b0000;

    // ★★★ 关键修复 2: 读数据选择逻辑 ★★★
    always @(*) begin
        case (addr_head)
            ADDR_IMEM: cpu_rdata = imem_rdata; // 这里的 imem_rdata 必须对应上面的 input
            ADDR_DMEM: cpu_rdata = dmem_rdata;
            ADDR_GPIO: cpu_rdata = gpio_rdata;
            ADDR_UART: cpu_rdata = uart_rdata;
            default:   cpu_rdata = 32'b0;
        endcase
    end

endmodule
