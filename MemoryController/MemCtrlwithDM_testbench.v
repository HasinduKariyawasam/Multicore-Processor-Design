`timescale 1ns/1ps
module MemCtrlwithDM_testbench ();

    reg clk;
    reg  op1, op2, op3, op4;
    reg [15:0] regAddr1, regAddr2, regAddr3, regAddr4;
    reg [15:0] data1, data2, data3, data4;
    reg WR1, WR2, WR3, WR4;
    reg [3:0] MR;
    wire [15:0] DOUT1, DOUT2, DOUT3, DOUT4;

    // generate clock
    always begin
        clk = 0; #10; clk = 1; #10;
    end

    // device under test
    MemCtrlwithDM dut(clk, op1, op2, op3, op4,
                      regAddr1, regAddr2, regAddr3, regAddr4,
                      data1, data2, data3, data4,
                      WR1, WR2, WR3, WR4,
                      MR, DOUT1, DOUT2, DOUT3, DOUT4);

    /*
    op1 = op2 = op3 = op4 = 0; WR1 = WR2 = WR3 = WR4 = 0;
    negedge -> regAddr1 = 0, regAddr2 = 1, regAddr3 = 2, regAddr4 = 3
    negedge -> data arrive
    negedge -> WR1 = WR2 = WR3 = WR4 = 1
    posedge -> (data write)
    
    negedge -> regAddr1 = 4, regAddr2 = 5, regAddr3 = 6, regAddr4 = 7; 
               WR1 = WR2 = WR3 = WR4 = 0
    negedge -> data arrive
    negedge -> WR1 = WR2 = WR3 = WR4 = 1
    posedge -> (data write)

    repeat 4 times

    negedge -> op1 = op2 = op3 = op4 = 1
    negedge -> op1 = op2 = op3 = op4 = 0
    */

    initial begin
        op1 = 0; op2 = 0; op3 = 0; op4 = 0;
        WR1 = 0; WR2 = 0; WR3 = 0; WR4 = 0;
        MR = 4'b0;
        data1 = 16'd0; data2 = 16'd0; data3 = 16'd0; data4 = 16'd0;
        #30;
        regAddr1 = (16'd0 << 2) + 16'd0; regAddr2 = (16'd0 << 2) + 16'd0; regAddr3 = (16'd0 << 2) + 16'd1; regAddr4 = (16'd0 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd1) $display("Core 1 M1-element1 data fetched");
		if(DOUT2 === 16'd1) $display("Core 2 M1-element1 data fetched");
		if(DOUT3 === 16'd5) $display("Core 3 M1-element1 data fetched");
		if(DOUT4 === 16'd5) $display("Core 4 M1-element1 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd1 << 2) + 16'd0; regAddr2 = (16'd1 << 2) + 16'd1; regAddr3 = (16'd1 << 2) + 16'd0; regAddr4 = (16'd1 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd1) $display("Core 1 M2-element1 data fetched");
		if(DOUT2 === 16'd2) $display("Core 2 M2-element1 data fetched");
		if(DOUT3 === 16'd1) $display("Core 3 M2-element1 data fetched");
		if(DOUT4 === 16'd2) $display("Core 4 M2-element1 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd2 << 2) + 16'd0; regAddr2 = (16'd2 << 2) + 16'd0; regAddr3 = (16'd2 << 2) + 16'd1; regAddr4 = (16'd2 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd2) $display("Core 1 M1-element2 data fetched");
		if(DOUT2 === 16'd2) $display("Core 2 M1-element2 data fetched");
		if(DOUT3 === 16'd6) $display("Core 3 M1-element2 data fetched");
		if(DOUT4 === 16'd6) $display("Core 4 M1-element2 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd3 << 2) + 16'd0; regAddr2 = (16'd3 << 2) + 16'd1; regAddr3 = (16'd3 << 2) + 16'd0; regAddr4 = (16'd3 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd5) $display("Core 1 M2-element2 data fetched");
		if(DOUT2 === 16'd6) $display("Core 2 M2-element2 data fetched");
		if(DOUT3 === 16'd5) $display("Core 3 M2-element2 data fetched");
		if(DOUT4 === 16'd6) $display("Core 4 M2-element2 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd4 << 2) + 16'd0; regAddr2 = (16'd4 << 2) + 16'd0; regAddr3 = (16'd4 << 2) + 16'd1; regAddr4 = (16'd4 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd3) $display("Core 1 M1-element3 data fetched");
		if(DOUT2 === 16'd3) $display("Core 2 M1-element3 data fetched");
		if(DOUT3 === 16'd7) $display("Core 3 M1-element3 data fetched");
		if(DOUT4 === 16'd7) $display("Core 4 M1-element3 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd5 << 2) + 16'd0; regAddr2 = (16'd5 << 2) + 16'd1; regAddr3 = (16'd5 << 2) + 16'd0; regAddr4 = (16'd5 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
		if(DOUT1 === 16'd9) $display("Core 1 M2-element3 data fetched");
		if(DOUT2 === 16'd10) $display("Core 2 M2-element3 data fetched");
		if(DOUT3 === 16'd9) $display("Core 3 M2-element3 data fetched");
		if(DOUT4 === 16'd10) $display("Core 4 M2-element3 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd6 << 2) + 16'd0; regAddr2 = (16'd6 << 2) + 16'd0; regAddr3 = (16'd6 << 2) + 16'd1; regAddr4 = (16'd6 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd4) $display("Core 1 M1-element4 data fetched");
		if(DOUT2 === 16'd4) $display("Core 2 M1-element4 data fetched");
		if(DOUT3 === 16'd8) $display("Core 3 M1-element4 data fetched");
		if(DOUT4 === 16'd8) $display("Core 4 M1-element4 data fetched");

        #15; MR = 4'b0;
        #10;
        regAddr1 = (16'd7 << 2) + 16'd0; regAddr2 = (16'd7 << 2) + 16'd1; regAddr3 = (16'd7 << 2) + 16'd0; regAddr4 = (16'd7 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
		if(DOUT1 === 16'd13) $display("Core 1 M2-element4 data fetched");
		if(DOUT2 === 16'd14) $display("Core 2 M2-element4 data fetched");
		if(DOUT3 === 16'd13) $display("Core 3 M2-element4 data fetched");
		if(DOUT4 === 16'd14) $display("Core 4 M2-element4 data fetched");
        #15; MR = 4'b0; 

        #10;
        regAddr1 = 16'd0; regAddr2 = 16'd1; regAddr3 = 16'd2; regAddr4 = 16'd3;
        #20;
        data1 = 16'b1110000000000111; data2 = 16'b0000000000000111;
        data3 = 16'b1111111111111111; data4 = 16'b1000000000000001;
        #20;
        WR1 = 1; WR2 = 1; WR3 = 1; WR4 = 1;

        #20; WR1 = 0; WR2 = 0; WR3 = 0; WR4 = 0;
        regAddr1 = 16'd4; regAddr2 = 16'd5; regAddr3 = 16'd6; regAddr4 = 16'd7;
        #20;
        data1 = 16'b1010101010101010; data2 = 16'b1111111100000000;
        data3 = 16'b1111000011110000; data4 = 16'b1100110011001100;
        #20;
        WR1 = 1; WR2 = 1; WR3 = 1; WR4 = 1;

        #20; WR1 = 0; WR2 = 0; WR3 = 0; WR4 = 0;
        regAddr1 = 16'd8; regAddr2 = 16'd9; regAddr3 = 16'd10; regAddr4 = 16'd11;
        #20;
        data1 = 16'b1110000000000111; data2 = 16'b0000000000000111;
        data3 = 16'b1111111111111111; data4 = 16'b1000000000000001;
        #20;
        WR1 = 1; WR2 = 1; WR3 = 1; WR4 = 1;

        #20; WR1 = 0; WR2 = 0; WR3 = 0; WR4 = 0;
        regAddr1 = 16'd12; regAddr2 = 16'd13; regAddr3 = 16'd14; regAddr4 = 16'd15;
        #20;
        data1 = 16'b1010101010101010; data2 = 16'b1111111100000000;
        data3 = 16'b1111000011110000; data4 = 16'b1100110011001100;
        #20;
        WR1 = 1; WR2 = 1; WR3 = 1; WR4 = 1;

        #20; WR1 = 0; WR2 = 0; WR3 = 0; WR4 = 0;
        op1 = 1; op2 = 1; op3 = 1; op4 = 1;

        #20; op1 = 0; op2 = 0; op3 = 0; op4 = 0;

        #200;
        $finish;
    end

endmodule //MemCtrlwithDM_testbench