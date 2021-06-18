module phase_1_harindu (Bus_in,Bus_out,clk,WR_AR, LDBUS_AR, LDADDR_AR, INC, DM, IM, WR_PC, LDBUS_PC, LDIADDR_PC);

   input [15:0] Bus_in; 
   input clk; 
   output [15:0] Bus_out; 
   input WR_AR, LDBUS_AR, LDADDR_AR, INC, WR_PC, LDBUS_PC, LDIADDR_PC; 
	output [7:0] DM;
	output [7:0] IM;
	 
	AR_register AR(Bus_in, clk, WR_AR, LDBUS_AR, LDADDR_AR, Bus_out, DM );
	PC_register PC(Bus_in, clk, WR_PC, LDBUS_PC, LDIADDR_PC, INC, Bus_out, IM);

endmodule



module buffer8(inputwires, outputwires, control);
	input [7:0] inputwires;
	input control;
	output [7:0] outputwires;
	
	assign outputwires = control ? inputwires: 8'bz;
	
	
	
endmodule

module buffer16(inputwires, outputwires, control);
	input [15:0] inputwires;
	input control;
	output [15:0] outputwires;
	
	assign outputwires = control ? inputwires: 16'bz;
	
	
endmodule


module AR_register (Bus_in, clk, WR, LDBUS, LDADDR, Bus_out,  DM );
	input [15:0] Bus_in;
	input clk;
	input WR;
	input LDBUS;
	input LDADDR;
	output [15:0] Bus_out;
	output [7:0] DM;
	reg [15:0] regis;
	
	buffer16 b1(regis[15:0],Bus_out[15:0],LDBUS);
	buffer8 b2(regis[7:0],DM[7:0],LDADDR);

	always @(posedge clk)
	
	begin
	
		if (WR == 1) regis <= Bus_in;
		
	end

endmodule

module PC_register (Bus_in, clk, WR, LDBUS, LDIADDR, INC, Bus_out,  IM );
	input [15:0] Bus_in;
	input clk;
	input WR;
	input LDBUS;
	input LDIADDR;
	input INC;
	output [15:0] Bus_out;
	output [7:0] IM;
	reg [15:0] regis;
	
	buffer16 b1(regis[15:0],Bus_out[15:0],LDBUS);
	buffer8 b2(regis[7:0],IM[7:0],LDIADDR);

	always @(posedge clk)
	
	begin
	
		if (WR == 1) regis <= Bus_in;
		if (INC == 1) regis <= regis + 16'b0000000000000001;
		
	end

endmodule
