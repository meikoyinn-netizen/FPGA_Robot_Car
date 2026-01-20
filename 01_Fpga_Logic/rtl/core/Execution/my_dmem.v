`timescale 1ns / 1ps

module my_dmem(
    input  wire        clk,
    input  wire        we_i,
    input  wire [31:0] addr_i,
    input  wire [31:0] data_i,
    output wire [31:0] data_o
);

    // ★★★ 扩容到 16KB (4096个字)，足以容纳 C 语言的 Stack ★★★
    reg [31:0] ram [0:4095];

    integer i;
    initial begin
        for (i=0; i<4096; i=i+1) ram[i] = 0;
    end

    // ★★★ 关键：地址截断 ★★★
    // 0x10004000 (16KB) 对应的地址线
    // 32位地址 >> 2 变成字地址
    // 取低 12 位 [13:2] 正好对应 4096 深度
    wire [11:0] real_addr = addr_i[13:2];

    assign data_o = ram[real_addr];

    always @(posedge clk) begin
        if (we_i) begin
            ram[real_addr] <= data_i;
        end
    end

endmodule