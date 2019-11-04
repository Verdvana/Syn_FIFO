onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Syn_FIFO_TB/clk
add wave -noupdate -radix unsigned /Syn_FIFO_TB/rst_n
add wave -noupdate -radix unsigned /Syn_FIFO_TB/wr_en
add wave -noupdate -radix unsigned /Syn_FIFO_TB/rd_en
add wave -noupdate -radix unsigned /Syn_FIFO_TB/data_in
add wave -noupdate -radix unsigned /Syn_FIFO_TB/full
add wave -noupdate -radix unsigned /Syn_FIFO_TB/empty
add wave -noupdate -radix unsigned /Syn_FIFO_TB/data_out
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/clk
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/rst_n
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/data_in
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/wr_en
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/wr_pointer
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/full
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/rd_en
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/rd_pointer
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/data_out
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/empty
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/status_cnt
add wave -noupdate -radix unsigned /Syn_FIFO_TB/u_Syn_FIFO/data_out_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10376 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ns} {882 ns}
