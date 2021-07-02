module MemoryController (input clk,
                      input  op1, op2, op3, op4,
                      input [15:0] regAddr1, regAddr2, regAddr3, regAddr4,
                      input [15:0] data1, data2, data3, data4,
                      input WR1, WR2, WR3, WR4,
                      input MR1, MR2, MR3, MR4,
                      input [63:0] datafromMem,
                      output memWR, MemREAD,
                      output [15:0] memAddr,
                      output [15:0] DOUT1, DOUT2, DOUT3, DOUT4,
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
    DL_Controller DataLoad(datafromMem, MR1, MR2, MR3, MR4,
                            regAddr1, regAddr2, regAddr3, regAddr4, MemREAD, memAddr_Load,
                            DOUT1, DOUT2, DOUT3, DOUT4);

    // store controller and registers
    StoreCtrlwithRegisters storeCtrlandReg(clk, op1, op2, op3, op4,
                                           regAddr1[3:0], regAddr2[3:0], regAddr3[3:0], regAddr4[3:0],
                                           data1, data2, data3, data4,
                                           WR1, WR2, WR3, WR4,
                                           swEnable, memWR, memAddr_Store, datatoMem);

    // switch
    switch switch(swEnable, memAddr_Store, memAddr_Load, memAddr);

endmodule //MemCtrlwithDM