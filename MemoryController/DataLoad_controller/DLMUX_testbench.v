`timescale 1ns/1ps
module DLMUX_testbench();
	
	reg [1:0] id;
    reg [15:0] c1,c2,c3,c4;
    reg [4:0] addr;
	wire [15:0] data;
	
	DL_MUX DL_MUX1(id,c1,c2,c3,c4,data);
	
	initial begin
		id=2'd0; c1 = 16'd13; c2 = 16'd14; c3 = 16'd15; c4 = 16'd16; #10;
		if(data === c1) $display("Chunk 1 fetched");
		
		id=2'd1; c1 = 16'd13; c2 = 16'd14; c3 = 16'd15; c4 = 16'd16; #10;
		if(data === c2) $display("Chunk 2 fetched");
		
		id=2'd3; c1 = 16'd13; c2 = 16'd14; c3 = 16'd15; c4 = 16'd16; #10;
		if(data === c4) $display("Chunk 4 fetched");
		
		id=2'd2; c1 = 16'd13; c2 = 16'd14; c3 = 16'd15; c4 = 16'd16; #10;
		if(data === c3) $display("Chunk 3 fetched");
		
	end

endmodule