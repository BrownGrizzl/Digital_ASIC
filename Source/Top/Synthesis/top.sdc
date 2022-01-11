create_clock -period 50 -name clk_20MHz [get_ports clk]
set_clock_uncertainty -hold 5 [get_ports clk]
set_clock_uncertainty -setup 5 [get_ports clk]
set_input_delay 10 -max -clock clk_20MHz [get_ports {In1}]
set_output_delay 10 -max -clock clk_20MHz [get_ports {Out1}]

