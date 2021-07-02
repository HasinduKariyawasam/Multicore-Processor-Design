module StoreCtrlwithRegisters (input clk,
                               input en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16,
                               input op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16,
                               input [3:0] regAddr1, regAddr2, regAddr3, regAddr4, regAddr5, regAddr6, regAddr7, regAddr8, regAddr9, regAddr10, regAddr11, regAddr12, regAddr13, regAddr14, regAddr15, regAddr16,
                               input [15:0] data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16,
                               input WR1, WR2, WR3, WR4, WR5, WR6, WR7, WR8, WR9, WR10, WR11, WR12, WR13, WR14, WR15, WR16,
                               output swEnable,
                               output wire memWrtoReg,
                               output [15:0] memAddr,
                               output [63:0] datatoMem);

    wire memWR;
    wire [3:0] rowaddr;

    // registers module
    Registers regBlock(clk, en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16,
                       regAddr1, regAddr2, regAddr3, regAddr4, regAddr5, regAddr6, regAddr7, regAddr8, regAddr9, regAddr10, regAddr11, regAddr12, regAddr13, regAddr14, regAddr15, regAddr16,
                       data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16,
                       WR1, WR2, WR3, WR4, WR5, WR6, WR7, WR8, WR9, WR10, WR11, WR12, WR13, WR14, WR15, WR16, memWrtoReg, rowaddr, datatoMem);

    // store controller
    StoreController storeController(clk, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16, memWR,
                                    swEnable, memWrtoReg, rowaddr, memAddr);

endmodule //StoreCtrlwithRegisters