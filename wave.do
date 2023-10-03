onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color White /tb/DUT/clk
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} /tb/DUT/rst
add wave -noupdate /tb/DUT/in
add wave -noupdate -color Gold -itemcolor Gold /tb/DUT/out
add wave -noupdate /tb/DUT/current_state
add wave -noupdate /tb/DUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
