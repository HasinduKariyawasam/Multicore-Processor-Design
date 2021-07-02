module MemoryController (input clk,
                      input  en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16,
                      input  op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16,
                      input [15:0] regAddr1, regAddr2, regAddr3, regAddr4, regAddr5, regAddr6, regAddr7, regAddr8,
                                   regAddr9, regAddr10, regAddr11, regAddr12, regAddr13, regAddr14, regAddr15, regAddr16,
                      input [15:0] data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12,
                                   data13, data14, data15, data16,
                      input WR1, WR2, WR3, WR4, WR5, WR6, WR7, WR8, WR9, WR10, WR11, WR12, WR13, WR14, WR15, WR16,
                      input MR1, MR2, MR3, MR4, MR5, MR6, MR7, MR8, MR9, MR10, MR11, MR12, MR13, MR14, MR15, MR16,
                      input [63:0] datafromMem,
                      output memWR, MemREAD,
                      output [15:0] memAddr,
                      output [15:0] DOUT1, DOUT2, DOUT3, DOUT4, DOUT5, DOUT6, DOUT7, DOUT8, DOUT9, DOUT10, DOUT11, DOUT12,
                                    DOUT13, DOUT14, DOUT15, DOUT16,
                      output [63:0] datatoMem);
    /*
    clk = clock
    op1 - op4 = OPEND flags (from each core)
    regAddr1 - regAddr4 = store addresses (from each core)
    data1 - data4 = data to write (from each core)
    WR1 - WR4 = data write signals (from each core)
    MR1 - MR4 = data read signals (from each core)
    datafromMem = data read from memory (from data memory)
    memWR = memory write signal (to data memory)
    MemREAD = memory read signal (to data memory)
    memAddr = memeory read address (to data memory)
    DOUT1 - DOUT4 = read data from memory (to each core)
    datatoMem = data to write the memory (to data memory)
    */

    wire swEnable;
    wire [15:0] memAddr_Store, memAddr_Load;

    // data load controller
    DL_Controller DataLoad(datafromMem, MR1, MR2, MR3, MR4, MR5, MR6, MR7, MR8, MR9, MR10, MR11, MR12, MR13, MR14, MR15, MR16,
                            regAddr1, regAddr2, regAddr3, regAddr4, regAddr5, regAddr6, regAddr7, regAddr8, 
                            regAddr9, regAddr10, regAddr11, regAddr12, regAddr13, regAddr14, regAddr15, regAddr16,
                            MemREAD, memAddr_Load,
                            DOUT1, DOUT2, DOUT3, DOUT4, DOUT5, DOUT6, DOUT7, DOUT8, DOUT9, DOUT10, DOUT11, DOUT12,
                            DOUT13, DOUT14, DOUT15, DOUT16);

    // store controller and registers
    StoreCtrlwithRegisters storeCtrlandReg(clk, en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16, 
                                           op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16,
                                           regAddr1[3:0], regAddr2[3:0], regAddr3[3:0], regAddr4[3:0], regAddr5[3:0], regAddr6[3:0], regAddr7[3:0], regAddr8[3:0],
                                           regAddr9[3:0], regAddr10[3:0], regAddr11[3:0], regAddr12[3:0], regAddr13[3:0], regAddr14[3:0], regAddr15[3:0], regAddr16[3:0],
                                           data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16,
                                           WR1, WR2, WR3, WR4, WR5, WR6, WR7, WR8, WR9, WR10, WR11, WR12, WR13, WR14, WR15, WR16,
                                           swEnable, memWR, memAddr_Store, datatoMem);

    // switch
    switch switch(swEnable, memAddr_Store, memAddr_Load, memAddr);

endmodule //MemCtrlwithDM