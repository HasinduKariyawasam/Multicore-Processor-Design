`timescale 1us/10ns
module ROM_testbench();
	
	reg [4:0] addr;
	wire [34:0] out;
	
	ROM ROM1(addr,out);
	
	initial begin
		addr=5'd0; #10;
		if(out !== 35'b00001010000000000000000000000000001) $display("Wrong FETCH1 output control signals");
		
		addr=5'd9; #10;
		if(out !== 35'b00001010000000000000000000000001010) $display("Wrong JMPNZY1 output control signals");
		
		addr=5'd11; #10;
		if(out !==  35'b00000000000000000000000000010000000) $display("Wrong JMPNZN1 output control signals");
		
		addr=5'd20; #10;
		if(out !== 35'b00100001000000000000000000000000000) $display("Wrong LOAD2 output control signals");
		
		addr=5'd23; #10;
		if(out !== 35'b00010000000000000000000000000000000) $display("Wrong STORE3 output control signals");
		
		addr=5'd18; #10;
		if(out !== 35'b00000110000000000111010011000000000) $display("Wrong MUL1 output control signals");
		
		addr=5'd29; #10;
		if(out == 35'd0) $display("FLAG"); // For undefined uI input address
		
		addr=5'd31; #10;
		if(out == 35'd0) $display("FLAG"); // For undefined uI input address
		
	end

endmodule
