`timescale 1ns/1ps
module processor_testbench ();

    reg clk;
    reg [15:0] DIN;
    wire [15:0] DMADDR, DOUT;
    wire MEMREAD, MEMWR;
    wire [15:0] INSIN, IMADDR; //test
    wire INSREAD;              //test
    wire [4:0] NXTADDR;        //test
    wire BR, ALUOP;                   //test
    wire [15:0] IROUT, ALUOUT, ACOUT, ALUIN, BIN, BOUT;         //test
    wire [2:0] ALUMUX, ALUCTRL; //test
    wire Z; //test

    // device under test
    processor dut(clk, DIN, DMADDR, DOUT, MEMREAD, MEMWR,
                INSIN, IMADDR, INSREAD, NXTADDR, BR, ALUOP, IROUT, ALUOUT,
                ACOUT, ALUIN, BIN, BOUT, ALUMUX, ALUCTRL, Z);

    // generate clock
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    initial begin
        #20000;
        $finish;
    end

endmodule //processor_testbench