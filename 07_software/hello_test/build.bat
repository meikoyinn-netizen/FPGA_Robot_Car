@echo off
set "PREFIX=riscv-none-elf-"
echo [Status] Cleaning up old files...
if exist *.o del *.o
if exist *.elf del *.elf
if exist *.mem del *.mem
if exist *.asm del *.asm

echo.
echo [1/4] Compiling C code (main.c)...
%PREFIX%gcc -march=rv32i -mabi=ilp32 -c main.c -o main.o
if %errorlevel% neq 0 goto error

echo [2/4] Compiling Assembly code (start.s)...
%PREFIX%gcc -march=rv32i -mabi=ilp32 -c start.s -o start.o
if %errorlevel% neq 0 goto error

echo [3/4] Linking (Generating .elf)...
:: -nostartfiles: 不使用标准库启动代码，用我们要自己写的 start.s
:: -Wl,-Map=output.map: 生成地图文件，方便看内存分布(可选)
%PREFIX%gcc -march=rv32i -mabi=ilp32 -T link.ld -nostartfiles -o firmware.elf start.o main.o
if %errorlevel% neq 0 goto error

echo [4/4] Generating Hex file (firmware.mem)...
:: 注意：一定要加 --verilog-data-width=4
%PREFIX%objcopy -O verilog --verilog-data-width=4 firmware.elf firmware.mem
if %errorlevel% neq 0 goto error

echo.
echo [5/4] Disassembling for Debug (firmware.asm)...
%PREFIX%objdump -d firmware.elf > firmware.asm

echo.
echo ==========================================
echo [Success] Compilation Done! 
echo Gen: firmware.mem (Use this for FPGA)
echo Gen: firmware.asm (Read this for Debug)
echo ==========================================
pause
exit /b 0

:error
echo.
echo ==========================================
echo [Error] Compilation Failed! 
echo ==========================================
pause
exit /b 1