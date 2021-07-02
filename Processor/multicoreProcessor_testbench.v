`timescale 1ns/1ps
module multicoreProcessor_testbench ();

    reg clk;
    reg [4:0] numCores = 5'd16;

    // generate clock
    always begin
        clk = 1; #10; clk = 0; #10;
    end

    // device under test
    multicoreProcessor dut(clk, numCores);

    // wait 200000ns
    initial begin
        #200000;
        $finish;
    end

endmodule //multicoreProcessor_testbench