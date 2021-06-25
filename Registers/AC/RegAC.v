module RegAC(clk,BIN,WR,LDBUS,LDALU,BOUT,ALU);
	/*
		Control signals:
		clk - Clock signal
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		LDALU - Control signal to load content in the register to the ALU
		
		Datapaths:
		BIN - The BUS to write to the register
		BOUT - The BUS to read content from the register
		ALU - The wire to the ALU from the register
	*/

	input clk, WR, LDBUS, LDALU;     // Clock and Control Signals
	input [15:0] BIN;
	output [15:0] BOUT;
	output [15:0] ALU;
	
	reg unsigned [15:0] register;	
	reg unsigned [15:0] BOUT;					// output to BUS
	reg unsigned [15:0] ALU;					// output to ALU

	
	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
		end
	
	
	always @ (~clk)
		begin
			if (LDBUS == 1)
				begin
					BOUT = register;
					ALU = 16'bz;
				end
			else 
				begin
					BOUT = 16'bz;
					if (LDALU == 1)
						ALU = register;
					else
						ALU = 16'bz;
				end
		end
	
endmodule
