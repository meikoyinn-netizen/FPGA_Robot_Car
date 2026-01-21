// syscalls.c - minimal syscalls for bare-metal newlib on RV32
#include <stdint.h>
#include <stddef.h>
#include <sys/stat.h>

// 复用你 main.c 里已经验证稳定的 uart_putc
// ⚠️ 注意：你的 main.c 里 uart_putc 必须不是 static（否则这里链接不到）
extern void uart_putc(char c);

// printf/puts 最终会走到这里
int _write(int fd, const char *buf, int len) {
    (void)fd;
    for (int i = 0; i < len; i++) {
        char c = buf[i];
        if (c == '\n') uart_putc('\r');
        uart_putc(c);
    }
    return len;
}

// ---- heap support (some libc functions may call malloc/printf internals) ----
extern char _end;               // linker script provides end of bss/heap start
static char *heap_end;

void* _sbrk(ptrdiff_t incr) {
    if (heap_end == 0) heap_end = &_end;
    char *prev = heap_end;
    heap_end += incr;
    return (void*)prev;
}

// ---- stubs to satisfy linker ----
int _close(int file) { (void)file; return -1; }
int _fstat(int file, struct stat *st) { (void)file; st->st_mode = S_IFCHR; return 0; }
int _isatty(int file) { (void)file; return 1; }
int _lseek(int file, int ptr, int dir) { (void)file; (void)ptr; (void)dir; return 0; }
int _read(int file, char *ptr, int len) { (void)file; (void)ptr; (void)len; return 0; }
int _open(const char *name, int flags, int mode) { (void)name; (void)flags; (void)mode; return -1; }
int _kill(int pid, int sig) { (void)pid; (void)sig; return -1; }
int _getpid(void) { return 1; }
void _exit(int status) { (void)status; while (1) {} }
