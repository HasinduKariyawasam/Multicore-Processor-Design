module MAP(clk,IR,out);

	input clk;
	input [7:0] IR;		// 8 bit OPCODE
	output [4:0] out;		// 5 bit address of 1st microinstruction mapped from OPCODE address
	
	reg [7:0] map;
	reg [4:0] out;
	
	always @ (posedge clk)
	begin
		map <= IR;
	end

	always @ (negedge clk)
		case (map)
			8'd0: out = 5'b00010;	// RSTALL
			8'd16: out = 5'b00011;	// CONST
			8'd32: out = 5'b00100;	// MOV
			8'd48: out = 5'b00101;	// SIZE
			8'd64: out = 5'b10011;	// SUB
			8'd80: out = 5'b01010;	// JMPNZ
			8'd96: out = 5'b01110;	// MOV02
			8'd112: out = 5'b10000;	// ADDX
			8'd128: out = 5'b10001;	// ADDY
			8'd144: out = 5'b10100;	// MUL
			8'd160: out = 5'b10010;	// ADD
			8'd176: out = 5'b10101;	// LOAD
			8'd192: out = 5'b01111;	// MOV13
			8'd208: out = 5'b11011;	// INCI
			8'd224: out = 5'b11000;	// STORE
			8'd240: out = 5'b11100;	// RSTI
		endcase
	
endmodule
