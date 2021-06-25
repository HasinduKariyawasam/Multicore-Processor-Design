// This is top level entity that integrates the two registers in to a single entity.

module integrated(BIN,BOUT,clk, DMADDR, IMADDR, WR_AR, WR_R2, LDBUS_R2, INC_PC, WR_PC, INC_R2, RST, RST_R2, LDBUS_AR);

   input [15:0] BIN; 
   input clk; 
   output [15:0] BOUT; 
   input WR_AR, WR_R2, LDBUS_R2, INC_PC, WR_PC, INC_R2, RST, RST_R2, LDBUS_AR; 
	output [15:0] DMADDR;
	output [15:0] IMADDR;
	
	wire [15:0] BOUT;
	 
	Reg3 Reg3_1(BIN, clk, WR_AR, DMADDR, LDBUS_AR, BOUT );
	Reg2 Reg2_1(BIN, clk, WR_PC, INC_PC, IMADDR);
	Reg1 Reg1_1(clk,BIN,RST,RST_R2,WR_R2,LDBUS_R2,INC_R2,BOUT);

endmodule





module Reg2 (BIN, clk, WR, INC, IMADDR);

/*
Control signals:

clk - Clock signal
WR - Control signal to write to the register
INC - Increment the register by 1


Data paths:

IMADDR - Wire that carries the instruction memory address from PC to instruction memory
BIN - The BUS to write to the register
*/

	input [15:0] BIN;
	input clk;
	input WR;
	input INC;
	output [15:0] IMADDR;

	reg unsigned [15:0] register;

	assign IMADDR = register;	
	
	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
			if (INC == 1)
				register <= register + 16'b0000000000000001;
		end

endmodule


module Reg3 (BIN, clk, WR, DMADDR, LDBUS, BOUT);

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
	input WR, LDBUS;
	output [15:0] DMADDR, BOUT;

	reg unsigned [15:0] register;
	reg unsigned [15:0] BOUT; //added
	
	assign DMADDR = register;

	always @ (posedge clk)
		begin
			if (WR == 1)
				register <= BIN;
		end
		
		always @ (~clk)
		begin
			if (LDBUS == 1)
				BOUT = register;
			else
				BOUT = 16'bz;
		end
	
endmodule

module Reg1(clk,BIN,RST,RST2,WR,LDBUS,INC,BOUT);
	/*
		Control signals:
		clk - Clock signal
		RST - Common RESET control signal
		RST2 - RESET signal to only reset R2
		WR - Control signal to write to register
		LDBUS - Control signal to load content in the register to the BUS
		INC - Increment R2 by 1
		
		Datapaths:
		BIN - The BUS to write to the register
		BOUT - The BUS to read content from the register
		ALU - The wire to the MUX from the register
	*/

	input clk, RST, RST2, WR, LDBUS, INC;     // Clock and Control signals
	input [15:0] BIN;
	output [15:0] BOUT;
	
	reg unsigned [15:0] reg2;
	reg unsigned [15:0] BOUT;	// output to BUS
	
	always @ (posedge clk)
		begin
			if (RST == 1 || RST2 == 1)
				reg2 <= 0;
				
			if (INC == 1)
				reg2 <= reg2 + 1;
			else if (WR == 1)
				reg2 <= BIN;
		end
		
	always @ (~clk)
		begin
			if (LDBUS == 1)
				BOUT = reg2;
			else
				BOUT = 16'bz;
		end
endmodule
