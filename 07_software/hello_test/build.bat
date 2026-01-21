@echo off
set "PREFIX=riscv-none-elf-"
echo [Status] Cleaning up old files...
if exist *.o del *.o
if exist *.elf del *.elf
if exist *.mem del *.mem
if exist *.asm del *.asm
if exist *.map del *.map

echo.
echo [1/5] Compiling C code (main.c)...
%PREFIX%gcc -march=rv32i -mabi=ilp32 -c main.c -o main.o
if %errorlevel% neq 0 goto error

echo [2/5] Compiling C code (syscalls.c)...
%PREFIX%gcc -march=rv32i -mabi=ilp32 -c syscalls.c -o syscalls.o
if %errorlevel% neq 0 goto error

echo [3/5] Compiling Assembly code (start.s)...
%PREFIX%gcc -march=rv32i -mabi=ilp32 -c start.s -o start.o
if %errorlevel% neq 0 goto error

echo [4/5] Linking (Generating .elf)...
%PREFIX%gcc -march=rv32i -mabi=ilp32 -T link.ld -nostartfiles ^
  -Wl,-Map=firmware.map ^
  -o firmware.elf start.o main.o syscalls.o
if %errorlevel% neq 0 goto error

echo [5/5] Generating Hex file (firmware.mem)...
%PREFIX%objcopy -O verilog --verilog-data-width=4 firmware.elf firmware.mem
if %errorlevel% neq 0 goto error

echo.
echo [Extra] Disassembling for Debug (firmware.asm)...
%PREFIX%objdump -d firmware.elf > firmware.asm

echo.
echo ==========================================
echo [Success] Compilation Done!
echo Gen: firmware.mem (Use this for FPGA)
echo Gen: firmware.asm (Read this for Debug)
echo Gen: firmware.map (Link map)
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
