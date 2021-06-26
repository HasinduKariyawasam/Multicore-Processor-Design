`timescale 1us/10ns
module RegAR_testbench();

	reg clk; 
	reg WR;
	reg [15:0] BIN;
	wire [15:0] DMADDR;
	
	AR_register AR_register1(BIN,clk,WR,DMADDR);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#50;
		WR=1'b1; BIN = 16'h00FF; #100; // WRITE to AR
		WR=1'b0; BIN = 16'hFFFF; #100; 
		WR=1'b1; BIN = 16'h00CC; #100; // WRITE to AR
		WR=1'b0; BIN = 16'h0EEF; #100; 
	end

endmodule