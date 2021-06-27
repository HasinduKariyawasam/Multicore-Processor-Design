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
	
	reg unsigned [15:0] register;
	reg unsigned [15:0] BOUT;	// output to BUS
	
	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
			if (RST == 1)
				register <= 16'b0;	
		end
		
	always @ (LDBUS)
		begin
			if (LDBUS == 1)
				BOUT = register;
			else
				BOUT = 16'bz;
		end
endmodule
