/*
    Control signals:
            ALUOP

    Data paths:
            MUXOUT - Output of the MUX

            ALU_IN - Input from IR
            BIN - Input from R5

*/

module ALU_OP(ALUOP, ALU_IN, BIN, MUXOUT);

    input ALUOP;

	input [15:0] ALU_IN;
	input [15:0] BIN;

	output [15:0] MUXOUT;

    assign MUXOUT = (ALUOP == 0) ?   BIN : ALU_IN;

endmodule
