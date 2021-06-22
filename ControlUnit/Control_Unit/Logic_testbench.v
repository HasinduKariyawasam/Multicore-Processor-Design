`timescale 1us/10ns
module Logic_testbench();
	
	reg [4:0] na, ir;
	reg z,br;
	wire [4:0] out;
	
	Logic Logic1(z,ir,na,br,out);
	
	initial begin
		br = 1'b0; na = 5'd0; z = 1'b0; ir = 5'd3; #10;
		if(out !== na) $display("Start of FETCH1 failed");
		
		br = 1'b0; na = 5'd1; z = 1'b0; ir = 5'd3; #10;
		if(out !== na) $display("Start of FETCH2 failed");
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b0; ir = 5'd21; #10;
		if(out !== ir) $display("Start of LOAD1 failed");
		
		br = 1'b0; na = 5'd22; z = 1'b0; ir = 5'd21; #10;
		if(out !== na) $display("Start of LOAD2 failed");
		
		br = 1'b0; na = 5'd23; z = 1'b0; ir = 5'd21; #10;
		if(out !== na) $display("Start of LOAD3 failed");
		
		br = 1'b0; na = 5'd0; z = 1'b0; ir = 5'd21; #10;
		if(out !== na) $display("Start of FETCH1 failed");
		
		br = 1'b0; na = 5'd1; z = 1'b0; ir = 5'd21; #10;
		if(out !== na) $display("Start of FETCH2 failed");
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b0; ir = 5'd19; #10;
		if(out !== ir) $display("Start of SUB1 failed");
		
		br = 1'b0; na = 5'd0; z = 1'b0; ir = 5'd21; #10;
		if(out !== na) $display("Start of FETCH1 failed");
		
		br = 1'b0; na = 5'd1; z = 1'b0; ir = 5'd21; #10;
		if(out !== na) $display("Start of FETCH2 failed");
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b0; ir = 5'd10; #10;
		if(out !== ir) $display("Start of JMPNZY1 failed");
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b1; ir = 5'd10; #10;
		if(out !== 5'd13) $display("Start of JMPNZN1 failed");
		
		br = 1'b0; na = 5'd11; z = 1'b1; ir = 5'd10; #10;
		if(out == na) $display("Next address check even if z=1 and br=0");
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b1; ir = 5'd18; #10;
		if(out == ir) $display("Ignoring z flag when instruction is not JMPNZ");
		
		br = 1'b1; na = 5'd4; z = 1'b1; ir = 5'd18; #10;
		if(out == ir) $display("Random test - na shouldn't be taken as next address");
		
		br = 1'b1; na = 5'd4; z = 1'b0; ir = 5'd18; #10;
		if(out == ir) $display("Random test - na shouldn't be taken as next address");
		
	end

endmodule

/* 

FETCH1
FETCH2
LOAD1
LOAD2
LOAD3
FETCH1
FETCH2
SUB1
FETCH1
FETCH2
JMPNZY1
FETCH1
FETCH2
SUB1
FETCH1
FETCH2
JMPNZN1
SOMETHING RANDOM

*/