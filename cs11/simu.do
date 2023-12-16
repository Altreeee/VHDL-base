vlib work

vcom -93 fsm.vhd
vcom -93 fsmtb.vhd

vsim -novopt fsmtb

view signals
add wave *

run -all