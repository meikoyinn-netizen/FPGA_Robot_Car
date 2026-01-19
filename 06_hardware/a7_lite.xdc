# 1. 时钟信号 (Pin J19 - 50MHz)
set_property -dict { PACKAGE_PIN J19 IOSTANDARD LVCMOS33 } [get_ports { sys_clk }]
create_clock -period 20.000 -name sys_clk_pin -waveform {0.000 10.000} [get_ports { sys_clk }]

# 2. 串口发送 (Pin V2)
set_property -dict { PACKAGE_PIN V2 IOSTANDARD LVCMOS33 } [get_ports { uart_tx }]

# 3. 心跳灯 (Pin M18 - 板载 LED1)
# 只要这个灯闪，说明时钟对了，复位也成功释放了
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { led }]

# 4. 生成配置 (防止报错)
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]