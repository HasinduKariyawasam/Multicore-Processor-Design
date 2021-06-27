module PC_register (BIN, clk, WR, INC, IMADDR);

/*
Control signals:

clk - Clock signal
WR - Control signal to write to the register
INC - Increment the register by 1


Data paths:

IMADDR - Wire that carries the instruction memory address from PC to instruction memory
BIN - The BUS to write to the register
*/

	input [15:0] BIN;
	input clk;
	input WR;
	input INC;
	output [15:0] IMADDR;

	reg unsigned [15:0] register;

	initial register = 16'b0000000000000000;

	assign IMADDR = register;	
	
	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
			if (INC == 1)
				register <= register + 16'b0000000000000001;
		end

endmodule
