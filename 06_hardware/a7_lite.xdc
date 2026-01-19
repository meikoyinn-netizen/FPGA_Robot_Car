set_property -dict { PACKAGE_PIN J19 IOSTANDARD LVCMOS33 } [get_ports { sys_clk }]
set_property -dict { PACKAGE_PIN AA1 IOSTANDARD LVCMOS33 } [get_ports { sys_rst_n }]
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { led_heartbeat }]

# 双发配置
set_property -dict { PACKAGE_PIN V2 IOSTANDARD LVCMOS33 } [get_ports { uart_tx_v2 }]
set_property -dict { PACKAGE_PIN U2 IOSTANDARD LVCMOS33 } [get_ports { uart_tx_u2 }]

# Flash 配置
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]