`timescale 1us/10ns
module nareg_testbench();

	reg clk; // clock
	reg [4:0] naddr;
	wire [4:0] out;
	
	nareg nareg1(clk,naddr,out);
	
	always
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		naddr = 5'd2; #200; // RSTALL1
		naddr = 5'd3; #200; // CONST1
		naddr = 5'd4; #200; // MOV1
		naddr = 5'd5; #200; // SIZE1
		naddr = 5'd19; #200; // SUB1
		naddr = 5'd10; #200; // JMPNZ1
		naddr = 5'd14; #200; // MOV021
		naddr = 5'd16; #200; // ADDX1
		naddr = 5'd17; #200; // ADDY1
		naddr = 5'd20; #200; // MUL1
		naddr = 5'd18; #200; // ADD1
		naddr = 5'd21; #200; // LOAD1
		naddr = 5'd15; #200; // MOV131
		naddr = 5'd27; #200; // INCI1
		naddr = 5'd24; #200; // STORE1
		naddr = 5'd28; #200; // RSTI1
				
	end

endmodule