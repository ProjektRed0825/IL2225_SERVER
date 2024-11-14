
create_clock -name clk -period 5 -waveform {0 2.5} [get_ports clk]

set_false_path -from [get_ports nrst]

#set_clock_uncertainty 0.3 [get_clock clk]

set_clock_uncertainty -setup 0.65 [get_clocks clk]
set_clock_uncertainty -hold 0.45 [get_clocks clk] 

