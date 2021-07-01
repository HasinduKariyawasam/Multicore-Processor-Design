module MemCtrlwithDM (input clk,
                      input  op1, op2, op3, op4,
                      input [15:0] regAddr1, regAddr2, regAddr3, regAddr4,
                      input [15:0] data1, data2, data3, data4,
                      input WR1, WR2, WR3, WR4,
                      input [3:0] MR,
                      output [15:0] DOUT1, DOUT2, DOUT3, DOUT4);

    wire memWR, swEnable, MemREAD;
    wire [15:0] memAddr_Store, memAddr_Load, memAddr;
    wire [63:0] datatoMem, datafromMem;

    // data load controller
    DL_Controller DataLoad(datafromMem, MR[3], MR[2], MR[1], MR[0],
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

    // data memory
    ram_data DM(datafromMem, memAddr, datatoMem, memWR, MemREAD, clk);

endmodule //MemCtrlwithDM