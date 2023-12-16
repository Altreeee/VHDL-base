vlib work

vcom -93 ADDC1.vhd
vcom -93 ADDC4.vhd
vcom -93 ADDC4_tb.vhd

vsim -novopt ADDC4_tb

view signals
add wave *
run -all