/*
Control signals:
clk - Clock signal
WR - Control signal to write to the register
LDBUS - Control signals to load ocntent in the register to the BUS
INC - Increment the register by 1
LDIADDR - Control signal to send the instruction memory address to the instruction memory module

Data paths:
IMADDR - Wire that carries the instruction memory address from PC to instruction memory
BIN - The BUS to write to the register
BOUT - The BUS to read content from the register
*/


module PC_register (BIN, clk, WR, LDBUS, LDIADDR, INC, BOUT,  IMADDR );
	input [15:0] BIN;
	input clk;
	input WR;
	input LDBUS;
	input LDIADDR;
	input INC;
	output [15:0] BOUT;
	output [7:0] IMADDR;

	reg unsigned [15:0] BOUT;
	reg unsigned [7:0] IMADDR;
	reg unsigned [15:0] register;

	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
		end
		
	always @ (~clk)
		begin
			if (LDBUS == 1)
				BOUT = register;
			else if (LDIADDR == 1)
				IMADDR = register[7:0];
		end

endmodule
