/*
Control signals:

clk - Clock signal

ALUMUX

Signal	Register
001		IR
101		R5
100		R1
010		IDX
011		IDY

Data paths:

MUXOUT - Output of the MUX
IR_ - Input from IR
R5_ - Input from R5
R1_ - Input from R1
IDX_ - Input from IDX_
IDY_ - Input from IDY_

*/
module ALU_MUX(ALUMUX, clk, IR_, R5_, R1_, IDX_, IDY_, MUXOUT);

	input [15:0] IR_;
	input [15:0] R5_;
	input [15:0] R1_;
	input [15:0] IDX_;
	input [15:0] IDY_;
	input clk;
	input [2:0] ALUMUX;
	output [15:0] MUXOUT;

   assign MUXOUT = ALUMUX[2] ? (ALUMUX[0] ? R5_ : R1_) : (ALUMUX[1] ? (ALUMUX[0] ? IDY_ : IDX_) : IR_);  

endmodule
