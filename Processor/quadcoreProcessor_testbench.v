`timescale 1ns/1ps
module quadcoreProcessor_testbench ();

    reg clk;

    // generate clock
    always begin
        clk = 1; #10; clk = 0; #10;
    end

    // device under test
    quadcoreProcessor dut(clk);

    // wait 200000ns
    initial begin
        #200000;
        $finish;
    end

endmodule //quadcoreProcessor_testbench