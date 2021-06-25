`timescale 1us/10ns

module testbench_ALU_MUX();

reg clk;            
reg [2:0] ALUMUX;
wire [15:0] MUXOUT;
reg [15:0] IR_,R5_,R1_,IDX_,IDY_;


ALU_MUX dut(.ALUMUX(ALUMUX), .clk(clk), .IR_(IR_), .R5_(R5_), .R1_(R1_), .IDX_(IDX_), .IDY_(IDY_), .MUXOUT(MUXOUT));


always // CLOCK
	begin
		clk = 1; #50; clk = 0; #50;
	end
	

initial begin

/*
ALUMUX

Signal	Register
001		IR
101		R5
100		R1
010		IDX
011		IDY
*/

#50;
ALUMUX = 3'b001; #50;
IR_ = 16'h000F; R5_ = 16'h00F0;R1_ = 16'h0F00;IDX_ = 16'hF000;IDY_ = 16'h0FF0;

#50;
ALUMUX = 3'b101; #50;
IR_ = 16'hE00F; R5_ = 16'h0EF0;R1_ = 16'h0FE0;IDX_ = 16'hF00E;IDY_ = 16'hEFFE;

#50;
ALUMUX = 3'b100; #50;
IR_ = 16'hA00F; R5_ = 16'h0AF0;R1_ = 16'h0FA0;IDX_ = 16'hF00A;IDY_ = 16'hAFFA;

#50;
ALUMUX = 3'b010; #50;
IR_ = 16'hB00F; R5_ = 16'h0BF0;R1_ = 16'h0FB0;IDX_ = 16'hF00B;IDY_ = 16'hBFFB;

#50;
ALUMUX = 3'b011; #50;
IR_ = 16'hC00F; R5_ = 16'h0CF0;R1_ = 16'h0FC0;IDX_ = 16'hF00C;IDY_ = 16'hCFFC;

end

endmodule