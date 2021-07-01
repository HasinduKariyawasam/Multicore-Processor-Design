module StoreCtrlwithRegisters (input clk,
                               input  op1, op2, op3, op4,
                               input [3:0] regAddr1, regAddr2, regAddr3, regAddr4,
                               input [15:0] data1, data2, data3, data4,
                               input WR1, WR2, WR3, WR4,
                               //output memWR,
                               output wire memWrtoReg,
                               output [15:0] memAddr,
                               output [63:0] datatoMem);

    //wire swEnable, memWrtoReg;
    wire swEnable, memWR;
    wire [3:0] rowaddr;

    // registers module
    Registers regBlock(clk, regAddr1, regAddr2, regAddr3, regAddr4, 
                       data1, data2, data3, data4, 
                       WR1, WR2, WR3, WR4, memWrtoReg, rowaddr, datatoMem);

    // store controller
    StoreController storeController(clk, op1, op2, op3, op4, memWR,
                                    swEnable, memWrtoReg, rowaddr, memAddr);

endmodule //StoreCtrlwithRegisters