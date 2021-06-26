module R3467(clk,BIN,RST,WR,LDBUS,BOUT);
	/*
		Control signals:
		clk - Clock signal
		RST - Common RESET control signal
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		
		Datapaths:
		BIN - The BUS to write to the register
		BOUT - The BUS to read content from the register
		ALU - The wire to the MUX from the register
	*/

	input clk, RST, WR, LDBUS;     // Clock and Control signals
	input [15:0] BIN;
	output [15:0] BOUT;
	
	reg unsigned [15:0] reg3467;
	reg unsigned [15:0] BOUT;	// output to BUS
	
	always @ (posedge clk)
		begin
			if (RST == 1)
				reg3467 <= 0;
				
			if (WR == 1)
				reg3467 <= BIN;
		end
		
	always @ (~clk)
		begin
			if (LDBUS == 1)
				BOUT = reg3467;
			else
				BOUT = 16'bz;
		end
endmodule
