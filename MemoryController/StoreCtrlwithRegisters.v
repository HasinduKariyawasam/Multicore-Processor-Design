module StoreCtrlwithRegisters (input clk,
                               input en1, en2, en3, en4,
                               input op1, op2, op3, op4,
                               input [3:0] regAddr1, regAddr2, regAddr3, regAddr4,
                               input [15:0] data1, data2, data3, data4,
                               input WR1, WR2, WR3, WR4,
                               output swEnable,
                               output wire memWrtoReg,
                               output [15:0] memAddr,
                               output [63:0] datatoMem);

    wire memWR;
    wire [3:0] rowaddr;

    // registers module
    Registers regBlock(clk, en1, en2, en3, en4, 
                       regAddr1, regAddr2, regAddr3, regAddr4, 
                       data1, data2, data3, data4, 
                       WR1, WR2, WR3, WR4, memWrtoReg, rowaddr, datatoMem);

    // store controller
    StoreController storeController(clk, op1, op2, op3, op4, memWR,
                                    swEnable, memWrtoReg, rowaddr, memAddr);

endmodule //StoreCtrlwithRegisters