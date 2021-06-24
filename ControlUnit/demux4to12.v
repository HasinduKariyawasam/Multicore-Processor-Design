module demux4to12(input  [3:0]  address,
						output [11:0] out);
						
	reg [11:0] paths;
	
	always @ (*)
		case (address)
			4'b0001: paths = 12'b100000000000;
			4'b0010: paths = 12'b010000000000;
			4'b0011: paths = 12'b001000000000;
			4'b0100: paths = 12'b000100000000;
			4'b0101: paths = 12'b000010000000;
			4'b0110: paths = 12'b000001000000;
			4'b0111: paths = 12'b000000100000;
			4'b1000: paths = 12'b000000010000;
			4'b1001: paths = 12'b000000001000;
			4'b1010: paths = 12'b000000000100;
			4'b1011: paths = 12'b000000000010;
			4'b1100: paths = 12'b000000000001;
			default: paths = 12'b000000000000;
		endcase
	
	assign out = paths;
endmodule