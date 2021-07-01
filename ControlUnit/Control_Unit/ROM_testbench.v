`timescale 1us/10ns
module ROM_testbench();
	
	reg [4:0] addr;
	wire [35:0] out;
	
	ROM ROM1(addr,out);
	
	initial begin
		addr=5'd0; #10;
		if(out !== 36'b000010100000000000000000000000000001) $display("Wrong FETCH1 output control signals");
		
		addr=5'd9; #10;
		if(out !== 36'b000010100000000000000000000000001010) $display("Wrong JMPNZY1 output control signals");
		
		addr=5'd11; #10;
		if(out !==  36'b000000000000000000000000000100000000) $display("Wrong JMPNZN1 output control signals");
		
		addr=5'd20; #10;
		if(out !== 36'b001000010000000000000000000000000000) $display("Wrong LOAD2 output control signals");
		
		addr=5'd23; #10;
		if(out !== 36'b000100000000000000000000000000000000) $display("Wrong STORE3 output control signals");
		
		addr=5'd18; #10;
		if(out !== 36'b000001100000000001110100110000000000) $display("Wrong MUL1 output control signals");
		
		addr=5'd29; #10;
		if(out == 36'd0) $display("FLAG"); // For undefined uI input address
		
		addr=5'd31; #10;
		if(out == 36'd0) $display("FLAG"); // For undefined uI input address
		
	end

endmodule
