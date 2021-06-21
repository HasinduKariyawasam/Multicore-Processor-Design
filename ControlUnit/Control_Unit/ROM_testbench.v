`timescale 1us/10ns
module ROM_testbench();
	
	reg [4:0] addr;
	wire [36:0] out;
	
	ROM ROM1(addr,out);
	
	initial begin
		addr=5'd0; #10;
		if(out !== 37'b0000001000000000000000000000000000001) $display("Wrong FETCH1 output control signals");
		
		addr=5'd10; #10;
		if(out !== 37'b0000001000000000000000000000000001011) $display("Wrong JMPNZY1 output control signals");
		
		addr=5'd13; #10;
		if(out !== 37'b0000000000000000000000000000010000000) $display("Wrong JMPNZN1 output control signals");
		
		addr=5'd23; #10;
		if(out !== 37'b0010000001000000000000000000000000000) $display("Wrong LOAD3 output control signals");
		
		addr=5'd26; #10;
		if(out !== 37'b0000100000000000000000000000000000000) $display("Wrong STORE3 output control signals");
		
		addr=5'd20; #10;
		if(out !== 37'b0000000110000000000111010011000000000) $display("Wrong MUL3 output control signals");
		
		addr=5'd29; #10;
		if(out == 37'd0) $display("FLAG"); // For undefined uI input address
		
		addr=5'd31; #10;
		if(out == 37'd0) $display("FLAG"); // For undefined uI input address
		
	end

endmodule
