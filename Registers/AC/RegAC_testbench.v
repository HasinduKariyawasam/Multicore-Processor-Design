`timescale 1us/10ns
module RegAC_testbench();

	reg clk; 
	reg WR, LDBUS, LDALU;
	reg [15:0] BIN;
	wire [15:0] BOUT, ALU;
	
	RegAC RegAC1(clk,BIN,WR,LDBUS,LDALU,BOUT,ALU);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#50;
		WR=1'b1; LDBUS=1'b0; LDALU=1'b0; BIN = 16'd16; #100; // WRITE to AC
		WR=1'b0; LDBUS=1'b1; LDALU=1'b0; BIN = 16'dx; #100; // LOAD BUS
		WR=1'b1; LDBUS=1'b0; LDALU=1'b0; BIN = 16'd64; #100; // WRITE to AC
		WR=1'b0; LDBUS=1'b0; LDALU=1'b1; BIN = 16'd32; #100; // LOAD ALU
		WR=1'b0; LDBUS=1'b1; LDALU=1'b0; BIN = 16'dx; #100; // LOAD BUS
	end

endmodule