`timescale 1ns/1ps
module processor_testbench ();

    reg clk;
    reg [15:0] DIN;
    wire [15:0] DMADDR, DOUT;
    wire MEMREAD, MEMWR;
    wire [15:0] INSIN, IMADDR; //test
    wire INSREAD;              //test
    wire [4:0] NXTADDR;        //test
    wire BR;                   //test
    wire [15:0] IROUT;         //test

    // device under test
    processor dut(clk, DIN, DMADDR, DOUT, MEMREAD, MEMWR,
                INSIN, IMADDR, INSREAD, NXTADDR, BR, IROUT);

    // generate clock
    always 
        begin
            clk = 1; #50; clk = 0; #50;
        end

    initial begin
        #1900;
        $finish;
    end

endmodule //processor_testbench