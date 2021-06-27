module DR(clk,BIN,WR,LDBUS,BOUT,DM,RST);
	/*
		Control signals:
		clk - Clock signal
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		RST - Reset the register
		
		Datapaths:
		BIN - The BUS to write to the register
		BOUT - The BUS to read content from the register
		DM - Output to the data memory
	*/

	input clk, WR, LDBUS, RST;     // Clock and Control signals
	input [15:0] BIN;
	output [15:0] BOUT;
    output [15:0] DM;
	
	reg unsigned [15:0] register;
	reg unsigned [15:0] BOUT;	// output to BUS
    
    assign DM = register;
	
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
