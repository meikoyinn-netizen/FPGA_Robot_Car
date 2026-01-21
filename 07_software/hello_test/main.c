#include <stdint.h>
#include <stdio.h>

#define UART_TX_ADDR        0x30000000u
#define UART_STATUS_ADDR    0x30000004u

#define UART_TX_PTR     ((volatile uint32_t *)UART_TX_ADDR)
#define UART_STATUS_PTR ((volatile uint32_t *)UART_STATUS_ADDR)

#define UART_STATUS_TX_READY (1u << 3)

static void delay(volatile uint32_t count) {
    while (count--) {
        __asm__ volatile("nop");
    }
}

// ⚠️ 必须不是 static，让 syscalls.c 里的 extern void uart_putc 能链接到
void uart_putc(char c) {
    while (((*UART_STATUS_PTR) & UART_STATUS_TX_READY) == 0u) {
        __asm__ volatile("nop");
    }
    *UART_TX_PTR = (uint32_t)(uint8_t)c;
}

static void uart_puts(const char *s) {
    while (*s) {
        char c = *s++;
        if (c == '\n') uart_putc('\r');
        uart_putc(c);
    }
}

int main(void) {
    // 先用直写确认系统活着
    uart_puts("RUN_PRINTF_TEST_20260121\r\n");

    // 再用 printf 验证 retarget 是否成功
    printf("PRINTF_OK\r\n");

    while (1) {
        // 先输出固定串（最稳）
        printf("0123456789\r\n");

        // 再输出递增数字（下一步）
        static int x = 0;
        printf("x=%d\r\n", x++);
        if (x >= 10) x = 0;

        delay(300000u);
    }
    return 0;
}
