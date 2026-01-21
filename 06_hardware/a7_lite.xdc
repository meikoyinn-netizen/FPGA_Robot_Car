# 1. 时钟信号 (Pin J19 - 50MHz)
set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports sys_clk]
create_clock -period 20.000 -name sys_clk_pin -waveform {0.000 10.000} [get_ports sys_clk]

# 2. 串口发送 (Pin V2)
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports uart_tx]

# 3. 心跳灯 (Pin M18 - 板载 LED1)
# 只要这个灯闪，说明时钟对了，复位也成功释放了
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports led]

# 4. 生成配置 (防止报错)
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list sys_clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 5 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {uart_fifo_count[0]} {uart_fifo_count[1]} {uart_fifo_count[2]} {uart_fifo_count[3]} {uart_fifo_count[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 30 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {u_pc_reg/pc0[2]} {u_pc_reg/pc0[3]} {u_pc_reg/pc0[4]} {u_pc_reg/pc0[5]} {u_pc_reg/pc0[6]} {u_pc_reg/pc0[7]} {u_pc_reg/pc0[8]} {u_pc_reg/pc0[9]} {u_pc_reg/pc0[10]} {u_pc_reg/pc0[11]} {u_pc_reg/pc0[12]} {u_pc_reg/pc0[13]} {u_pc_reg/pc0[14]} {u_pc_reg/pc0[15]} {u_pc_reg/pc0[16]} {u_pc_reg/pc0[17]} {u_pc_reg/pc0[18]} {u_pc_reg/pc0[19]} {u_pc_reg/pc0[20]} {u_pc_reg/pc0[21]} {u_pc_reg/pc0[22]} {u_pc_reg/pc0[23]} {u_pc_reg/pc0[24]} {u_pc_reg/pc0[25]} {u_pc_reg/pc0[26]} {u_pc_reg/pc0[27]} {u_pc_reg/pc0[28]} {u_pc_reg/pc0[29]} {u_pc_reg/pc0[30]} {u_pc_reg/pc0[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list u_pc_reg/dbus_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list u_pc_reg/dbus_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list u_uart_mmio/bus_uart_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list uart_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list uart_tx_fire]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]
