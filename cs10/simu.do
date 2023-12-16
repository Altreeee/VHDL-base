vlib work

vcom -93 board.vhd
vcom -93 ramchip.vhd
vcom -93 board_tb.vhd

vsim -novopt board_tb

view signals
add wave *

run -all