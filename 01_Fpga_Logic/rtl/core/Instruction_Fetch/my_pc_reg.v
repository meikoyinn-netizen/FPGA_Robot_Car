`timescale 1ns / 1ps

module my_pc_reg(
    input  wire        clk,
    input  wire        rst_n,
    
    // 控制信号
    input  wire        stall,      // 暂停信号 (目前 Top 里给的是 0)
    input  wire        jump_flag,  // 跳转信号 (1=跳, 0=不跳)
    input  wire [31:0] jump_addr,  // 跳转的目标地址
    
    output reg  [31:0] pc
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 32'b0; // 复位归零
        end 
        else if (stall) begin
            pc <= pc;    // 暂停保持不变
        end 
        else if (jump_flag) begin
            pc <= jump_addr; // 【关键】如果有跳转请求，直接加载新地址
        end 
        else begin
            pc <= pc + 4;    // 正常顺序执行
        end
    end

endmodule