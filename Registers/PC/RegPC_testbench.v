`timescale 1us/10ns
module RegPC_testbench();

	reg clk; 
	reg WR;
	reg INC;
	reg [15:0] BIN;
	wire [15:0] IMADDR;
	
	PC_register PC_register1(BIN,clk,WR,INC,IMADDR);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#50;
		WR=1'b1; INC =1'b0; BIN = 16'h00FF; #100; // WRITE to PC
		WR=1'b0; INC =1'b0; BIN = 16'hFFFF; #100; 
		WR=1'b0; INC =1'b1; BIN = 16'h00CC; #100; // Increment PC
		WR=1'b1; INC =1'b0; BIN = 16'hFFFF; #100; // WRITE to PC 1111111111111111
		WR=1'b0; INC =1'b1; BIN = 16'h00CC; #100; // Increment PC to see overflow
	end

endmodule