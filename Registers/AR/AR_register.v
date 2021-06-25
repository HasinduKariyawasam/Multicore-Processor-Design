module AR_register(BIN, clk, WR, DMADDR);

/*
Control signals:
clk - Clock signal
WR - Control signal to write to the register

Data paths:
DMADDR - Wire that carries the data memory address from AR to data memory
BIN - The BUS to write to the register
*/

	input [15:0] BIN;
	input clk;
	input WR;
	output [15:0] DMADDR;

	reg unsigned [15:0] BOUT;
	reg unsigned [15:0] register;
	
	
	assign DMADDR = register;

	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
		end
	
endmodule