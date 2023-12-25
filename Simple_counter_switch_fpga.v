//controll display with switch and count it down to 0
module Simple_counter_switch_fpga(
								input clk,
								output reg [0:7]d	
												);
		reg clk_1=0;
		integer count_1;
		always @(posedge clk) begin
			if(count_1 == 25000000)
				clk_1 = ~ clk_1;
			else

		end

endmodule 

