vlib work

vcom -93 serialor.vhd
vcom -93 serialor_tb.vhd

vsim -novopt serialor_tb(TB1)

view signals
add wave *
run -all