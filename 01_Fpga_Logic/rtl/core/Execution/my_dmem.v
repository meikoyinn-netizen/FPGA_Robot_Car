`timescale 1ns / 1ps

module my_dmem(
    input  wire        clk,
    
    // 控制信号
    input  wire        we_i,   // 写使能 (1=写, 0=读)
    
    // 数据接口
    input  wire [31:0] addr_i, // 地址 (来自 ALU 计算结果)
    input  wire [31:0] data_i, // 要写入的数据 (来自 RegFile 的 rs2)
    output wire [31:0] data_o  // 读出的数据 (要去 RegFile 的 rd)
);

    // 定义内存：64个 32位的数据 (共256字节)
    reg [31:0] ram [0:63];

    // --- 读操作 (组合逻辑) ---
    // 只要地址变，数据立刻变 (RISC-V 规定按字节寻址，所以 >> 2)
    assign data_o = ram[addr_i[31:2]];

    // --- 写操作 (时序逻辑) ---
    always @(posedge clk) begin
        if (we_i) begin
            ram[addr_i[31:2]] <= data_i;
            
            // 调试打印：方便你在 Tcl Console 里看到 CPU 改了内存
            // %h 表示以16进制打印
            $display("DMEM: Writing Data %h to Addr %h", data_i, addr_i);
        end
    end

    // --- 初始化 (可选) ---
    integer i;
    initial begin
        for (i=0; i<64; i=i+1) ram[i] = 0;
        
        // 预存一个数据测试 LW 指令
        // 地址 0x10 (16) 处存一个 0x6666
        ram[4] = 32'h00006666; 
    end

endmodule