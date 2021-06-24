module AR_register (BIN, clk, WR, LDBUS, LDADDR, BOUT,  DMADDR );

/*
Control signals:
clk - Clock signal
WR - Control signal to write to the register
LDBUS - Control signal to load content in the register to the BUS
LDADDR - Control signal to send the data memory address to the data memory module

Data paths:
DMADDR - Wire that carries the data memory address from AR to data memory
BIN - The BUS to write to the register
BOUT - The BUS to read content from the register
*/

	input [15:0] BIN;
	input clk;
	input WR;
	input LDBUS;
	input LDADDR;
	output [15:0] BOUT;
	output [15:0] DMADDR;

	reg unsigned [15:0] BOUT;
	reg unsigned [15:0] DMADDR;
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
			else if (LDADDR == 1)
				DMADDR = register;
		end

endmodule