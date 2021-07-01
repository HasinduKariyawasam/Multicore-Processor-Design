`timescale 1ns/1ps
module StoreController_testbench ();

    reg clk, op1, op2, op3, op4;
    wire memWR;
    wire swEnable, memWrtoReg;
    wire [3:0] rowaddr;
    wire [15:0] rowaddrtoSw;

    // generate clock
    always begin
        clk = 0; #10; clk = 1; #10;
    end

    // device under test
    StoreController StoreController(clk, op1, op2, op3, op4, memWR, 
                                    swEnable, memWrtoReg, rowaddr, rowaddrtoSw);
            
    /*
    negedge -> op1, op2, op3, op4 = 1; (opendFlag = 1)
    posedge -> (memWR = 1, swEnable = 1) // STORE state
    negedge -> (rowaddr = 1000; memWrtoReg = 1)
    negedge -> (rowaddr = 1001; memWrtoReg = 1)
    negedge -> (rowaddr = 1010; memWrtoReg = 1)
    negedge -> (rowaddr = 1011; memWrtoReg = 1)
    negedge -> (rowaddr = 1000; memWrtoReg = 0, storeEnd = 1)
    posedge -> (memWR = 0, swEnable = 0) // IDLE state
    */
    initial begin
        op1 = 0; op2 = 0; op3 = 0; op4 = 0;
        #20;
        op1 = 1; op2 = 1; op3 = 1; op4 = 1;
        #20;
        op1 = 0; op2 = 0; op3 = 0; op4 = 0;

        #300;
        $finish;
    end


endmodule //StoreController_testbench