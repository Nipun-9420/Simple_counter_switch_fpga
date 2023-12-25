//controll display with switch and count it down to 0
module Simple_counter_switch_fpga(
								input clk,
								output reg [0:7]d1,
								output reg [0:7]d2,
								output reg [0:7]d3,
								output reg [0:7]d4,
								output reg [0:7]d5,
								output reg [0:7]d6
												);
		reg clk_1=0;
		integer count_clk,d_number =0 ;
		//---------------------------------------------------------------Clok sacling
		always @(posedge clk) 
		begin
			if(count_clk == 25000000)
				begin
					clk_1 = ~ clk_1;
					count_clk = 0;
				end
			else
				count_clk =count_clk +1;

		//----------------------counting
			
		end
		always @(posedge clk_1) 
		begin

			if (d_number >= 9 ) 
				begin
					d_number = 0;
				end	
			else
				begin
				  d_number = d_number+1;
				end

		end
		//------------------------when d_number changes
		always @(d_number) 
			begin
				 sev_disp(d_number,d1);
				 sev_disp(d_number,d2);
				 sev_disp(d_number,d3);
				 sev_disp(d_number,d4);
				 sev_disp(d_number,d5);
				 sev_disp(d_number,d6);
			end
		
		
		//----------------------------------------------------------display task
			task automatic sev_disp (input reg [0:7] c_number,output reg [0:7]disp);
				begin
				  	case	  (c_number)      			 									// 6543210
		                	    0 : disp <= 8'b00000011;								// to show 0
		                	    1 : disp <= 8'b10011111;								// to show 1
		                	    2 : disp <= 8'b00100101;								// to show 2
		                	    3 : disp <= 8'b00001101;								// to show 3
		                	    4 : disp <= 8'b10011001;								// to show 4
		                	    5 : disp <= 8'b01001001;								// to show 5
		                	    6 : disp <= 8'b01000001;								// to show 6
		                	    7 : disp <= 8'b00011111;								// to show 7
		                	    8 : disp <= 8'b00000001;								// to show 8
		                	    9 : disp <= 8'b00001001;								// to show 9
		            	default:    disp <= 8'b11111111;								// to show 0
		       	 	endcase
				end
			endtask
		//----------------------------------------------------end display task
endmodule 

