module IR(clk,IM,WR,LDBUS,LDALU,BOUT,ALU,CU);
	/*
		Control signals:
		clk - Clock signal
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		LDALU - Control signal to load content in the register to the ALU via ALUMUX
		
		Datapaths:
		IM   - The BUS to write to the register
		BOUT - The BOUT  to read content from the register
		ALU  - The wire to the MUX from the register
	*/

	input clk, WR, LDBUS, LDALU;     // Clock and Control Signals
	input [15:0] IM;
	output [15:0] BOUT;
	output [15:0] ALU;
   	output [15:0] CU;
	
	reg unsigned [15:0] register;	

	reg unsigned [15:0] BOUT;					// output to BUS
	reg unsigned [15:0] ALU;					// output to ALU

   	assign CU = register;
	
	initial register = 16'b1111111100000000;

	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= IM;
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
