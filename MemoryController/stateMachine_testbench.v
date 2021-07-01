`timescale 1ns/1ps
module stateMachine_testbench ();

    reg clk;
    reg opendFlag, storeEnd;
    wire memWrite, regOut, swEnable;

    // device under test
    storeStateMachine dut(clk, opendFlag, storeEnd,
                        memWrite, regOut, swEnable);

    // generate the clock
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    // applying test conditions and checking the results
    initial 
        begin
            opendFlag = 0; storeEnd = 0;
            #10; opendFlag = 1; #15;
            if (memWrite && regOut && swEnable)
                $display("Entered STORE state successfully!");
            else
                $display("Error in going to STORE state!");

            #5; opendFlag = 0; #15;
            $display("memWrite = %b, regOut = %b, swEnable = %b", memWrite, regOut, swEnable);

            #5; storeEnd = 1; #15;
            if (memWrite || regOut || swEnable)
                $display("Error in going to IDLE state!");
            else
                $display("Entered IDLE state successfully!");

            #20;
            $finish;
        end

endmodule //stateMachine_testbench