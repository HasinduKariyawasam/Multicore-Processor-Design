module StoreController (input clk,
                        input op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16,
                        output wire memWR, 
                        output swEnable, memWrtoReg,
                        output [3:0] rowaddr,
                        output [15:0] rowaddrtoSw);

    /*
    clk = clock
    op1 - op4 = end operation signals from cores
    memWrite = write memory (to data memory)
    swEnable = switch enable
    memWrtoReg = write memory (to registers)
    rowaddr = memory row address (to registers)
    rowaddrtoSw = memory row address (to switch)

    opendFlag = operation end flag (from register controller)
    storeEnd = store has ended (from register controller)
    memWR = write to memory (from state machine to register controller)
    */
    
    wire opendFlag, storeEnd;

    // state machine
    storeStateMachine stateMachine(clk, opendFlag, storeEnd,
                                    memWR, swEnable);

    // register controller
    register_ctrl regControl(clk, memWR, rowaddr, rowaddrtoSw,
                            memWrtoReg, storeEnd);

    // operation end flag
    opend_flag opend_flag(opendFlag, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16);

    // assign memWrite = memWR;

endmodule //StoreController