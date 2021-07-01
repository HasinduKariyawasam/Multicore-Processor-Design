module MemCtrlwithDM (input clk,
                      input  op1, op2, op3, op4,
                      input [3:0] regAddr1, regAddr2, regAddr3, regAddr4,
                      input [15:0] data1, data2, data3, data4,
                      input WR1, WR2, WR3, WR4,
                      input MR,
                      output [63:0] dataOut);

    wire memWR;
    wire [15:0] memAddr;
    wire [63:0] datatoMem;

    // store controller and registers
    StoreCtrlwithRegisters storeCtrlandReg(clk, op1, op2, op3, op4,
                                           regAddr1, regAddr2, regAddr3, regAddr4,
                                           data1, data2, data3, data4,
                                           WR1, WR2, WR3, WR4,
                                           memWR, memAddr, datatoMem);

    // data memory
    ram_data DM(dataOut, memAddr, datatoMem, memWR, MR, clk);

endmodule //MemCtrlwithDM