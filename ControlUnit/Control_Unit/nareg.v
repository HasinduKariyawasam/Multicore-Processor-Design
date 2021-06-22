module nareg(clk,naddr,out);

	input clk;
	input [4:0] naddr;	// next address output from the logic circuit
	output [4:0] out;		// decision: next address
	
	reg [4:0] out;
	
	always @ (posedge clk)
		out <= naddr;

endmodule
