`timescale 1ns / 1ps

module tb_top_test();
    reg clk;
    reg rst_n;
    
    // --- 观察信号 (必须要和 riscv_top 的 output 对应) ---
    wire [31:0] pc;
    wire [31:0] alu_res;
    wire [31:0] dmem_addr;   // 观察写内存地址
    wire [31:0] dmem_wdata;  // 观察写入的数据

    // --- 实例化 CPU 顶层 ---
    riscv_top u_top (
        .clk(clk),
        .rst_n(rst_n),
        
        // 调试信号连接
        .pc_debug(pc),
        .alu_result_debug(alu_res),
        .dmem_addr_debug(dmem_addr),
        .dmem_wdata_debug(dmem_wdata)
    );

    // --- 时钟生成 (50MHz) ---
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    // --- 测试流程 ---
    initial begin
        rst_n = 0;
        #55 rst_n = 1; // 复位释放
        
        // 运行 1000ns，足够跑完几条指令
        #1000;
        
        $stop; // 停止仿真
    end

endmodule