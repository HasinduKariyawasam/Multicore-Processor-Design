module DL_Controller(input [63:0] data,
                    input MR1, MR2, MR3, MR4, MR5, MR6, MR7, MR8, MR9, MR10, MR11, MR12, MR13, MR14, MR15, MR16,
                    input [15:0] MADDR1, MADDR2, MADDR3, MADDR4, MADDR5, MADDR6, MADDR7, MADDR8,
                                 MADDR9, MADDR10, MADDR11, MADDR12, MADDR13, MADDR14, MADDR15, MADDR16,
                    output MEMREAD,
                    output [15:0] MEMADDR,
                    output [15:0] DOUT1, DOUT2, DOUT3, DOUT4, DOUT5, DOUT6, DOUT7, DOUT8, DOUT9, DOUT10, DOUT11, DOUT12,
                                  DOUT13, DOUT14, DOUT15, DOUT16);
    /*
        Module that handles the loading of data from memory to multiple cores simultaneously
        data - 64-bit input data from data memory
        MRi - Memory read control signal coming from the i'th core
        MADDRi - Memory read address coming from the i'th core

        MEMADDR - Row address in the data memory
        DOUTi - 16-bit data for the i'th core
    */
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16;

    assign MEMREAD = (MR1 == 1 && MR2 == 1 && MR3 == 1 && MR4 == 1 && MR5 == 1 && MR6 == 1 && MR7 == 1 && MR8 == 1 &&
                     MR9 == 1 && MR10 == 1 && MR11 == 1 && MR12 == 1 && MR13 == 1 && MR14 == 1 && MR15 == 1 && MR16 == 1) ? 1'b1 : 1'b0; // output memread control signal to Data Memory
    assign MEMADDR = {2'b0, MADDR1[15:2]}; // output data memory row id
	 

    DL_MUX DL_MUX1(MADDR1[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out1);
    
    DL_MUX DL_MUX2(MADDR2[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out2);

    DL_MUX DL_MUX3(MADDR3[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out3);

    DL_MUX DL_MUX4(MADDR4[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out4);

    DL_MUX DL_MUX5(MADDR5[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out5);
    
    DL_MUX DL_MUX6(MADDR6[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out6);

    DL_MUX DL_MUX7(MADDR7[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out7);

    DL_MUX DL_MUX8(MADDR8[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out8);

    DL_MUX DL_MUX9(MADDR9[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out9);
    
    DL_MUX DL_MUX10(MADDR10[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out10);

    DL_MUX DL_MUX11(MADDR11[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out11);

    DL_MUX DL_MUX12(MADDR12[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out12);

    DL_MUX DL_MUX13(MADDR13[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out13);
    
    DL_MUX DL_MUX14(MADDR14[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out14);

    DL_MUX DL_MUX15(MADDR15[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out15);

    DL_MUX DL_MUX16(MADDR16[1:0],
                data[63:48], data[47:32], data[31:16], data[15:0],
                out16);

    assign DOUT1 = MEMREAD ? out1: 16'bz;
    assign DOUT2 = MEMREAD ? out2: 16'bz;
    assign DOUT3 = MEMREAD ? out3: 16'bz;
    assign DOUT4 = MEMREAD ? out4: 16'bz;
    assign DOUT5 = MEMREAD ? out5: 16'bz;
    assign DOUT6 = MEMREAD ? out6: 16'bz;
    assign DOUT7 = MEMREAD ? out7: 16'bz;
    assign DOUT8 = MEMREAD ? out8: 16'bz;
    assign DOUT9 = MEMREAD ? out9: 16'bz;
    assign DOUT10 = MEMREAD ? out10: 16'bz;
    assign DOUT11 = MEMREAD ? out11: 16'bz;
    assign DOUT12 = MEMREAD ? out12: 16'bz;
    assign DOUT13 = MEMREAD ? out13: 16'bz;
    assign DOUT14 = MEMREAD ? out14: 16'bz;
    assign DOUT15 = MEMREAD ? out15: 16'bz;
    assign DOUT16 = MEMREAD ? out16: 16'bz;

endmodule
