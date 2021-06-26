`timescale 1us/10ns
module R2_testbench();

	reg clk; 
	reg RST, WR, LDBUS, INC;
	reg [15:0] BIN;
	wire [15:0] BOUT;
	
	R2 R2_1(clk,BIN,RST,WR,LDBUS,INC,BOUT);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#50;
		RST=1'b1; WR=1'b0; LDBUS=1'b0; INC=1'b0; BIN = 16'dx; #100; // Common RESET
		RST=1'b0; WR=1'b0; LDBUS=1'b1; INC=1'b0; BIN = 16'dx; #100; // LOAD BUS
		RST=1'b0; WR=1'b0; LDBUS=1'b0; INC=1'b1; BIN = 16'dx; #100; // Increment
		RST=1'b0; WR=1'b0; LDBUS=1'b1; INC=1'b0; BIN = 16'dx; #100; // LOAD BUS
		RST=1'b0; WR=1'b0; LDBUS=1'b0; INC=1'b0; BIN = 16'dx; #100; // R2 RESET
		RST=1'b0; WR=1'b0; LDBUS=1'b1; INC=1'b0; BIN = 16'dx; #100; // LOAD BUS
		RST=1'b0; WR=1'b1; LDBUS=1'b0; INC=1'b0; BIN = 16'd35; #100; // WRITE
		RST=1'b0; WR=1'b0; LDBUS=1'b1; INC=1'b0; BIN = 16'dx; #100; // LOAD BUS
		RST=1'b1; WR=1'b0; LDBUS=1'b0; INC=1'b0; BIN = 16'dx; #100; // R2 RESET
	end

endmodule