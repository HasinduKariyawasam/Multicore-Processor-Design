module Reg15(clk,BIN,RST,WR,LDBUS,LDALU,BOUT,ALU);
	/*
		Control signals:
		clk - Clock signal
		RST - RESET control signal
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		LDALU - Control signal to load content in the register to the ALU via ALUMUX
		
		Datapaths:
		BIN - The BUS to write to the register
		BOUT - The BUS to read content from the register
		ALU - The wire to the MUX from the register
	*/

	input clk, RST, WR, LDBUS, LDALU;     // Clock and Control Signals
	input [15:0] BIN;
	output [15:0] BOUT;
	output [15:0] ALU;
	
	reg unsigned [15:0] register;	
	reg unsigned [15:0] BOUT;					// output to BUS
	reg unsigned [15:0] ALU;					// output to ALU

	
	always @ (posedge clk)
		begin
			if (RST == 1)
				register <= 16'b0;
			else if (WR == 1)
				register <= BIN;
		end
		
	always @ (LDBUS or LDALU)
		begin
			if (LDBUS == 1)
				BOUT = register;
			else 
				begin
					BOUT = 16'bz;
					if (LDALU == 1)
						ALU = register;
				end
		end
endmodule
