/* link.ld - 告诉 GCC 我们的内存布局 */
OUTPUT_ARCH(riscv)
ENTRY(_start)   /* 程序入口标签叫 _start */

MEMORY
{
    /* 这里的 LENGTH 需要根据您 Verilog 中实际 IMEM/DMEM 大小修改 */
    /* 假设 IMEM 是 16KB, DMEM 是 16KB */
    IMEM (rx) : ORIGIN = 0x00000000, LENGTH = 16K
    DMEM (rw) : ORIGIN = 0x10000000, LENGTH = 16K
}

SECTIONS
{
    /* 代码段：放在 IMEM */
    .text : {
        *(.text)      /* 所有的代码 */
    } > IMEM

    /* 数据段：放在 DMEM */
    .data : {
        *(.data)
    } > DMEM

    /* 堆栈段：虽然我们还没有复杂的栈，但为了安全，让 SP 指向 DMEM 结尾 */
    /* .bss 是未初始化的变量 */
    .bss : {
        *(.bss)
    } > DMEM
    
    /* 定义一个符号，告诉启动代码堆栈顶在哪里 (DMEM 尾部) */
    PROVIDE(_stack_top = ORIGIN(DMEM) + LENGTH(DMEM));
}