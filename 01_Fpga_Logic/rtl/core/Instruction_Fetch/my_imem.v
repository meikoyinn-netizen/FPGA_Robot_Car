`timescale 1ns / 1ps

// ============================================================
// my_imem.v  (Async read, low-bit indexing, file init)
// 目的：
// 1) 不引入同步读的 1 拍延迟（避免 CPU 取指错位导致串口乱码）
// 2) 使用“低位索引”避免 LUT 爆炸
// 3) 深度可调：先用够用的深度（例如 8192 words = 32KB）
// ============================================================
module my_imem #(
    parameter integer IMEM_WORDS = 8192,   // ✅ 建议先用 8192/4096/2048，看你的程序大小
    parameter integer ADDR_LSB    = 2       // 32-bit word 对齐
)(
    // 端口 A: 给 PC 取指用 (Instruction Fetch)
    input  wire [31:0] addr,
    output wire [31:0] rdata,

    // 端口 B: 给总线读数据用 (Data Load)
    input  wire [31:0] data_addr,
    output wire [31:0] data_rdata
);

    // 索引位宽：IMEM_WORDS=8192 => 13 bits
    localparam integer INDEX_W = (IMEM_WORDS <= 1) ? 1 : $clog2(IMEM_WORDS);

    // ✅ 只取“够用的低位”做索引，避免 addr[31:2] 造成巨大译码逻辑
    wire [INDEX_W-1:0] idx_a = addr[ADDR_LSB + INDEX_W - 1 : ADDR_LSB];
    wire [INDEX_W-1:0] idx_b = data_addr[ADDR_LSB + INDEX_W - 1 : ADDR_LSB];

    // 存储体（组合读）
    reg [31:0] mem [0:IMEM_WORDS-1];

    assign rdata      = mem[idx_a];
    assign data_rdata = mem[idx_b];

    integer k;
    initial begin
        // 默认填 NOP，防止文件不够长时跑飞
        for (k = 0; k < IMEM_WORDS; k = k + 1) begin
            mem[k] = 32'h0000_0013; // NOP = addi x0,x0,0
        end

        // ✅ 继续沿用你的文件（你也可以改成相对路径 firmware.mem）
        // 绝对路径能用就先用，先把系统跑通
        $readmemh("E:/lky/study/FPGA_Robot_Car/01_Fpga_Logic/rtl/core/Instruction_Fetch/firmware.mem", mem);

        // 如果你想改成相对路径（更稳），就把 firmware.mem 加入 Vivado Sources，然后用：
        // $readmemh("firmware.mem", mem);
    end

endmodule
