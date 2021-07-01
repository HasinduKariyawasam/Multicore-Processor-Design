module Logic(Z,IR,naddr,br,out);

	input Z,br;
	input [4:0] IR;		// mapped IR address
	input [4:0] naddr;	// from next address field in control register
	output [4:0] out;		// decision: next address
	
	reg [4:0] out;
	
	always @ (*) // activate whenever an input changes
		// currently IR all ones is mapped to FETCH1 in MAP.
		begin
			if (IR == 5'b00000) // START of the machine
				out = IR;
			else begin
				if (br == 0)
					out = naddr;
				else
					begin
						if ((Z == 1) & (IR == 5'b01001))				// to quit JUMP
							out = 5'b01011;
						else													// any other instruction or to JUMP
							out = IR;
					end
					
				end
			end

endmodule
