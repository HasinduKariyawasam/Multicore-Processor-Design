module StoreController (input clk,
                        input op1, op2, op3, op4,
                        output memWrite, swEnable, memWrtoReg,
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
    startStore = start storing (to register controller)
    storeEnd = store has ended (from register controller)
    */
    
    wire opendFlag, startStore, storeEnd;

    // state machine
    storeStateMachine stateMachine(clk, opendFlag, storeEnd,
                                    memWrite, swEnable);

    // register controller
    register_ctrl regControl(clk, startStore, rowaddr, rowaddrtoSw,
                            memWrite, storeEnd);

    // operation end flag
    opend_flag opend_flag(opendFlag, op1, op2, op3, op4);

endmodule //StoreController