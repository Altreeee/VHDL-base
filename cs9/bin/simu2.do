vlib work

vcom -93 ramchip.vhd
vcom -93 ramchip2_tb.vhd

vsim ramchip2_tb(Bench)

view signals
add wave *

run -all