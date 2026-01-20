`timescale 1ns / 1ps

module my_imem(
    // 端口 A: 给 PC 取指用 (Instruction Fetch)
    input  wire [31:0] addr,
    output wire [31:0] rdata,
    
    // ★★★ 端口 B: 给总线读数据用 (Data Load) ★★★
    input  wire [31:0] data_addr, // 来自 ALU 的地址
    output wire [31:0] data_rdata // 读出的数据发给总线
);

    // 32KB 内存
    reg [31:0] mem [0:8191];

    initial begin
        // ⚠️ 请改为您电脑上的实际绝对路径！例如：
        // $readmemh("D:/FPGA_Project/src/firmware.mem", mem); 
        $readmemh("E:/lky/study/FPGA_Robot_Car/01_Fpga_Logic/rtl/core/Instruction_Fetch/firmware.mem", mem);
    end

    // 端口 A 逻辑 (取指)
    assign rdata = mem[addr[14:2]];

    // ★★★ 端口 B 逻辑 (读数据) ★★★
    // 逻辑完全一样，只是地址源不同
    assign data_rdata = mem[data_addr[14:2]];

endmodule