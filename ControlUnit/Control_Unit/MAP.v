module MAP(IR,out);

	input [7:0] IR;		// 8 bit OPCODE
	output [4:0] out;		// 5 bit address of 1st microinstruction mapped from OPCODE address
	
	reg [4:0] out;
	
	always @ (IR)
		case (IR)
			8'd0: out = 5'b00010;	// RSTALL
			8'd16: out = 5'b00011;	// CONST
			8'd32: out = 5'b00100;	// MOV
			8'd48: out = 5'b00101;	// SIZE
			8'd64: out = 5'b10001;	// SUB
			8'd80: out = 5'b01001;	// JMPNZ
			8'd96: out = 5'b01100;	// MOV02
			8'd112: out = 5'b01110;	// ADDX
			8'd128: out = 5'b01111;	// ADDY
			8'd144: out = 5'b10010;	// MUL
			8'd160: out = 5'b10000;	// ADD
			8'd176: out = 5'b10011;	// LOAD
			8'd192: out = 5'b01101;	// MOV13
			8'd208: out = 5'b11000;	// INCI
			8'd224: out = 5'b10101;	// STORE
			8'd240: out = 5'b11001;	// RSTI
			8'd241: out = 5'b11010; // OPEND
			8'd255: out = 5'b00000; // FETCH
			default: out = 5'b11111; // When there's no mapping
		endcase
	
endmodule
