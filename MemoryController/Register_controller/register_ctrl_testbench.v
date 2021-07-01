`timescale 1us/10ns
module register_ctrl_testbench();

	reg clk; 
	reg state_ctrl_store;
	wire [3:0] rowaddr;
	wire [15:0] sw2_out;	
	wire writemem;
	wire state_ctrl_done;

	
	register_ctrl dut(clk,state_ctrl_store,rowaddr, sw2_out, writemem,state_ctrl_done);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		state_ctrl_store=1'b0;
		#200;
		state_ctrl_store=1'b1; #100;state_ctrl_store = 1'b0; // WRITE to AR
		#600;
		state_ctrl_store=1'b1; #100;state_ctrl_store = 1'b0; // WRITE to AR
		#600;		
		$finish;
	end

endmodule