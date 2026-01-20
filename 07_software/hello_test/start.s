/* start.s */
.section .text
.global _start

_start:
    /* 1. 初始化栈指针 sp */
    /* link.ld 告诉了我们要把 sp 设置到哪里 (_stack_top) */
    la sp, _stack_top

    /* 2. 跳转到 C 语言的 main 函数 */
    call main

    /* 3. 如果 main 返回了，就死循环 */
loop_forever:
    j loop_forever
    