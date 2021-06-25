`timescale 1us/10ns
module Reg15_testbench();

	reg clk; 
	reg RST, WR, LDBUS, LDALU;
	reg [15:0] BIN;
	wire [15:0] BOUT, ALU;
	
	Reg15 Reg15_1(clk,BIN,RST,WR,LDBUS,LDALU,BOUT,ALU);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#50;
		RST=1'b1; WR=1'b0; LDBUS=1'b0; LDALU=1'b0; BIN = 16'dx; #100; // RESET
		RST=1'b0; WR=1'b0; LDBUS=1'b1; LDALU=1'b0; BIN = 16'dx; #100; // LOAD BUS
		RST=1'b0; WR=1'b1; LDBUS=1'b0; LDALU=1'b0; BIN = 16'd32; #100; // WRITE
		RST=1'b0; WR=1'b0; LDBUS=1'b1; LDALU=1'b0; BIN = 16'dx; #100; // LOAD BUS
		RST=1'b0; WR=1'b1; LDBUS=1'b0; LDALU=1'b0; BIN = 16'd64; #100; // WRITE
		RST=1'b0; WR=1'b0; LDBUS=1'b0; LDALU=1'b1; BIN = 16'd32; #100; // LOAD ALU
		RST=1'b1; WR=1'b0; LDBUS=1'b0; LDALU=1'b0; BIN = 16'dx; #100; // RESET			
	end

endmodule