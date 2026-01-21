#include <stdint.h>

// ============================================================================
// 1. 硬件地址定义
// ============================================================================
// UART 发送寄存器 (只写)
#define UART_TX_ADDR 0x30000000

// 定义指针：volatile 告诉编译器不要优化，每次都要真去读写该地址
#define UART_TX_PTR  ((volatile uint32_t *)UART_TX_ADDR)

// ============================================================================
// 2. 驱动函数
// ============================================================================

// 简单的延时函数
void delay(int count) {
    while (count--) {
        asm volatile("nop"); // 防止编译器把空循环优化掉
    }
}

// 发送一个字符
void uart_putc(char c) {
    // 之前我们需要 while(busy); 
    // 但现在您的 riscv_top.v 里有 cpu_stall = bus_uart_wen & tx_busy;
    // 这意味着如果串口忙，CPU 会自动停在这一行指令上不动。
    // 所以我们可以直接写！这就是硬件流控的威力。
    *UART_TX_PTR = c;
}

// 打印字符串
void print_str(const char *str) {
    while (*str != '\0') {
        char c = *str;
        
        // 自动处理换行：遇到 \n 自动补一个 \r，防止“阶梯状”输出
        if (c == '\n') {
            uart_putc('\r'); // 回到行首
        }
        
        uart_putc(c);
        str++;
    }
}

// 打印十进制单个数字
void print_digit(int value) {
    uart_putc('0' + (value % 10));
}

// ============================================================================
// 3. 主函数
// ============================================================================
int main() {
    char hello[] = "Hello\n";

    print_str(hello);

    while (1) {
        for (int i = 0; i < 10; i++) {
            print_digit(i);
            uart_putc('\n');
            delay(300000);
        }
    }

    return 0; // 永远不会运行到这里
}
