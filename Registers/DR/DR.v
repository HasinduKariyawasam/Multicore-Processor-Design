module DR(clk,BIN,WR,LDBUS,BOUT);
	/*
		Control signals:
		clk - Clock signal
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		
		Datapaths:
		BIN - The BUS to write to the register
		BOUT - The BUS to read content from the register
		ALU - The wire to the MUX from the register
	*/

	input clk, WR, LDBUS, INC;     // Clock and Control signals
	input [15:0] BIN;
	output [15:0] BOUT;
	
	reg unsigned [15:0] regDR;
	reg unsigned [15:0] BOUT;	// output to BUS
	
	always @ (posedge clk)
		begin	
			if (WR == 1)
				regDR <= BIN;
		end
		
	always @ (~clk)
		begin
			if (LDBUS == 1)
				BOUT = regDR;
			else
				BOUT = 16'bz;
		end
endmodule
