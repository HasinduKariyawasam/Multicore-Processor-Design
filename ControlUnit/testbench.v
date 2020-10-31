`timescale 1us/10ns
module testbench();

	reg clk;
	reg [36:0] ROMOUT;
	reg [7:0] IRLSB;
	wire SP, BR;
	wire MR, MW, MBUF;
	wire INSR, INSBUF;
	wire [11:0] WREG, RREG;
	wire [5:0] LDALU;
	wire [2:0] ALUMUX;
	wire [2:0] ALU;
	wire ALUOP;
	wire [1:0] INC;
	wire [6:0] RST;
	wire [4:0] NXTADD;
	
	parameter [36:0] FETCH0 = 37'b0000001000000000000000000000000000001;
	parameter [36:0] FETCH1 = 37'b01000100100000000000000000000100xxxxx;
	parameter [36:0] RSTALL = 37'b0000000000000000000000000000000100000;
	parameter [36:0] CONST0	= 37'b0000000010100001000000010111000000000;
	parameter [36:0] MOV0	= 37'b1000000000000000000000000000000000000;
	
	parameter [3:0] AR = 4'b0001;
	parameter [3:0] AC = 4'b1100;
	
	controlSignals test(clk, ROMOUT, IRLSB[7:4], IRLSB[3:0], SP, BR, MBUF, MR, MW, INSBUF, INSR,
							  WREG[11], WREG[10], WREG[9], WREG[8], WREG[7], WREG[6], WREG[5], WREG[4],
							  WREG[3], WREG[2], WREG[1], WREG[0], RREG[11], RREG[10], RREG[9], RREG[8],
							  RREG[7], RREG[6], RREG[5], RREG[4], RREG[3], RREG[2], RREG[1], RREG[0],
							  LDALU[5], LDALU[4], LDALU[3], LDALU[2], LDALU[1], LDALU[0],
							  ALUOP, INC[1], INC[0], RST[6], RST[5], RST[4], RST[3], RST[2], RST[1], RST[0],
							  ALUMUX, ALU, NXTADD);
							  
	always
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial
		begin
			#20;
			ROMOUT = FETCH0; #200;
			ROMOUT = FETCH1; #200;
			ROMOUT = RSTALL; #200;
			
			ROMOUT = FETCH0; #200;
			ROMOUT = FETCH1; #200;
			ROMOUT = CONST0; IRLSB = 8'b00000010; #200;
			
			ROMOUT = FETCH0; #200;
			ROMOUT = FETCH1; #200;
			ROMOUT = MOV0; IRLSB = {AR, AC}; #200;
			
			$finish;
		end
	
endmodule