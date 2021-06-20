module Logic(Z,IR,naddr,br,out);

	input Z,br;
	input [4:0] IR;		// mapped IR address
	input [4:0] naddr;	// from next address field in control register
	output [4:0] out;		// decision: next address
	
	reg [4:0] out;
	
	always @ (*) // activate whenever an input changes
		begin
			if (br == 0)
				out = naddr;
			else
				if ((Z == 1) & (IR == 5'b01010))				// to quit JUMP
					out = 5'b01101;
				else													// any other instruction or to JUMP
					out = IR;
				end

endmodule
