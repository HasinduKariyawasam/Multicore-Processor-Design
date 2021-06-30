module DL_Controller(input [63:0] data,
                    input MR1, MR2, MR3, MR4,
                    input [15:0] MADDR1, MADDR2, MADDR3, MADDR4,
                    output MEMREAD,
                    output [15:0] MEMADDR,
                    output [15:0] DOUT1, DOUT2, DOUT3, DOUT4);
    /*
        Module that handles the loading of data from memory to multiple cores simultaneously
        data - 64-bit input data from data memory
        MRi - Memory read control signal coming from the i'th core
        MADDRi - Memory read address coming from the i'th core

        MEMADDR - Row address in the data memory
        DOUTi - 16-bit data for the i'th core
    */

    assign MEMREAD = (MR1 == 1 && MR2 == 1 && MR3 == 1 && MR4 == 1) ? 1'b1 : 1'b0; // output memread control signal to Data Memory
    assign MEMADDR = {2'b0, MADDR1[15:2]}; // output data memory row id
	 

    DL_MUX DL_MUX1(MADDR1[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                DOUT1);
    
    DL_MUX DL_MUX2(MADDR2[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                DOUT2);

    DL_MUX DL_MUX3(MADDR3[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                DOUT3);

    DL_MUX DL_MUX4(MADDR4[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                DOUT4);

endmodule
