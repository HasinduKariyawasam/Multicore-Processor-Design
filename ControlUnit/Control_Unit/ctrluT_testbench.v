`timescale 1us/10ns
module ctrluT_testbench();

	reg clk; // clock
	reg br,z;
	reg [7:0] ir;
	reg [4:0] na;
	wire [4:0] out;
	
	ctrlu_top ctrlu_top1(clk,br,z,ir,na,out);
	
	always
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#60;
		br = 1'b0; na = 5'd0; z = 1'b0; ir = 8'd0; #100; // To release FETCH1
		
		br = 1'b0; na = 5'd1; z = 1'b0; ir = 8'd176; #100; // To release FETCH2 
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b0; ir = 8'd176; #100; // To release LOAD1
		
		br = 1'b0; na = 5'd22; z = 1'b0; ir = 8'd176; #100; // To release LOAD2
		
		br = 1'b0; na = 5'd23; z = 1'b0; ir = 8'd176; #100; // To release LOAD3
		
		br = 1'b0; na = 5'd0; z = 1'b0; ir = 8'd176; #100; // To release FETCH1
		
		br = 1'b0; na = 5'd1; z = 1'b0; ir = 8'd64; #100; // To release FETCH2
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b0; ir = 8'd64; #100; // To release SUB1
		
		br = 1'b0; na = 5'd0; z = 1'b0; ir = 8'd64; #100; // To release FETCH1
		
		br = 1'b0; na = 5'd1; z = 1'b0; ir = 8'd64; #100; // To release FETCH2
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b0; ir = 8'd80; #100; // To release JMPNZY1
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b1; ir = 8'd80; #100; // To release JMPNZN1
		
		br = 1'b0; na = 5'd11; z = 1'b1; ir = 8'd80; #100; // To release instruction according to naddr
		
		br = 1'b1; na = 5'bxxxxx; z = 1'b1; ir = 8'd0; #100; // Ignoring z flag when instruction is not JMPNZ
		
		br = 1'b1; na = 5'd4; z = 1'b1; ir = 8'd208; #100; // Random test - na shouldn't be taken as next address
		
		br = 1'b1; na = 5'd4; z = 1'b0; ir = 8'd160; #100; // Random test - na shouldn't be taken as next address
				
	end

endmodule