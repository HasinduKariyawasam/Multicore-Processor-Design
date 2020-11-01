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
			8'b00000001: out = 5'b00010;	// RSTALL
			8'b00000010: out = 5'b00011;	// CONST
			8'b00000011: out = 5'b00100;	// MOV
			8'b00000100: out = 5'b00101;	// SIZE
			8'b00000101: out = 5'b01010;	// JMPNZ
			8'b00000110: out = 5'b01110;	// MOVMSB
			8'b00000111: out = 5'b01111;	// MOVLSB
			8'b00001000: out = 5'b10000;	// ADDX
			8'b00001001: out = 5'b10001;	// ADDY
			8'b00001010: out = 5'b10010;	// ADD
			8'b00001011: out = 5'b10011;	// SUB
			8'b00001100: out = 5'b10100;	// MUL
			8'b00001101: out = 5'b10101;	// LOAD
			8'b00001110: out = 5'b10111;	// STORE
			8'b00001111: out = 5'b11001;	// INCI
			8'b00010000: out = 5'b11010;	// RSTI
		endcase
	
endmodule
