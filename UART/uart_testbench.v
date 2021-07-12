`timescale 1ns/10ps
module uart_testbench ();

    reg clk;
    reg button;
    reg txDone;
    reg [63:0] data_in;

    wire [7:0] data_tx;
    wire [15:0] data_addr;
    wire memread;
    wire txEn;

    //dut
    uart_ctrl uart_ctrl(clk, button, txDone, data_in,
                        data_tx, data_addr, memread, txEn);

    always begin
        clk = 1; #10; clk = 0; #10;
    end

    initial begin
        button = 1; txDone = 0;
        data_in = (8'd8 << 56) + (8'd7 << 48) + (8'd6 << 40) + (8'd5 << 32) + (8'd4 << 24) + (8'd3 << 16) + (8'd2 << 8) + 8'd1;
        #27; button = 0;
        #20; button = 1;
        #120;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;

        #120;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;

        #120;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;

        #120;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;
        #100;
        txDone = 1; #20; txDone = 0;

        #200;
        $finish;
    end

endmodule //uart_testbench