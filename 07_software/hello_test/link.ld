/* link.ld - GCC 链接脚本：IMEM/DMEM 内存布局 */
OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
  /* ✅ 扩大 IMEM：原来 16K -> 128K（你硬件也要同步改 my_imem.v） */
  IMEM (rx) : ORIGIN = 0x00000000, LENGTH = 128K

  /* DMEM 先保持 16K（按你原脚本） */
  DMEM (rw) : ORIGIN = 0x10000000, LENGTH = 16K
}

SECTIONS
{
  /* 代码段 */
  .text : ALIGN(4)
  {
    KEEP(*(.text._start))
    *(.text .text.*)
    *(.init)
    *(.fini)
  } > IMEM

  /* 只读数据（字符串常量、格式化字符串等会在这里，非常关键） */
  .rodata : ALIGN(4)
  {
    *(.rodata .rodata.*)
    *(.srodata .srodata.*)
  } > IMEM

  /* 已初始化数据：加载镜像在 IMEM，运行地址在 DMEM */
  .data : ALIGN(4)
  {
    _sdata = .;
    *(.data .data.*)
    *(.sdata .sdata.*)
    _edata = .;
  } > DMEM AT > IMEM
  _sidata = LOADADDR(.data);

  /* 未初始化数据 */
  .bss : ALIGN(4)
  {
    _sbss = .;
    *(.bss .bss.*)
    *(.sbss .sbss.*)
    *(COMMON)
    _ebss = .;
  } > DMEM

  /* ✅ heap end：给 _sbrk 用（修复你报的 undefined reference to _end） */
  _end = .;
  PROVIDE(end = .);

  /* 栈顶：DMEM 尾部 */
  PROVIDE(_stack_top = ORIGIN(DMEM) + LENGTH(DMEM));
}
