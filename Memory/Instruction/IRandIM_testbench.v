`timescale 1ns/1ps
module IRandIM_testbench ();

    reg clk;
    reg WIR, RIR, LDALUIR;
    reg [15:0] INSADD;
    reg INSREAD;

    wire [15:0] INSIN, BOUT, ALUOUT, IROUT;

    // generate clock
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    //dut
    IRandIM dut(clk, INSREAD, WIR, RIR, LDALUIR, INSADD,
                INSIN, BOUT, ALUOUT, IROUT);

    initial begin
        WIR = 0; RIR = 0; LDALUIR = 0; INSREAD = 0;
        INSADD = 16'd0;
        #10;
        INSREAD = 1; WIR = 1;
        //#20; INSREAD = 0; WIR = 0; //RIR = 1;
        #10;
        INSADD = 16'd1; INSREAD = 0; WIR = 0;
        #10;
        INSREAD = 1; WIR = 1; //RIR = 0;
        //#20; INSREAD = 0; WIR = 0; //RIR = 1;
        #10;
        INSADD = 16'd2; INSREAD = 0; WIR = 0;
        #10;
        INSREAD = 1; WIR = 1;  //RIR = 0;
        //#20; INSREAD = 0; WIR = 0; //RIR = 1;
        #30;
        $finish;
    end    

endmodule //IRandIM_testbench