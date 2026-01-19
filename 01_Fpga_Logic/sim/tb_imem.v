`timescale 1ns / 1ps

module tb_imem();

    // 1. 声明信号
    reg  [31:0] addr_i; // 模拟 PC 发出的地址
    wire [31:0] inst_o; // 观察读出的指令

    // 2. 实例化被测模块 (Connecting)
    my_imem u_imem (
        .addr (addr_i),
        .inst (inst_o)
    );

    // 3. 激励过程 (模拟 PC 的变化)
    initial begin
        // A. 初始状态
        addr_i = 0;
        #10; // 等待 10ns
        
        // B. 模拟 PC 变为 0
        addr_i = 32'h0000_0000;
        #10; // 此时观察 inst_o 应该是 00a00093
        
        // C. 模拟 PC 变为 4
        addr_i = 32'h0000_0004;
        #10; // 此时观察 inst_o 应该是 01400113 (ram[1])
        
        // D. 模拟 PC 变为 8
        addr_i = 32'h0000_0008;
        #10; // 此时观察 inst_o 应该是 002081b3 (ram[2])

        // E. 乱给一个地址 (比如 40)
        addr_i = 40;
        #10; 
        
        $stop; // 停止仿真
    end

endmodule