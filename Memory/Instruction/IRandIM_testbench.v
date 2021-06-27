`timescale 1ns/1ps
module IRandIM_testbench ();

    reg clk, Z;
    reg [15:0] BIN;

    wire INSREAD, WIR, RIR, LDALUIR;
    wire [2:0]	ALUMUX, ALUCTRL;
    wire [15:0] INSIN, BOUT, ALUOUT, IROUT, INSADD;
    wire [4:0] NXTADDR;
    wire BR;

    wire MEMREAD, MEMWR, WAR, WDR, WPC, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
        RAR, RDR, RPC, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
        LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
        ALUOP, R2INC, PCINC,
        RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7;

    // generate clock
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    //dut
    IRandIM dut(clk, Z,
                BIN,
                MEMREAD, MEMWR,
                WAR, WDR, WPC, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
                RAR, RDR, RPC, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                ALUOP, R2INC, PCINC,
                RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
                ALUMUX, ALUCTRL,
                INSREAD, WIR, RIR, LDALUIR,
                INSIN, BOUT, ALUOUT, IROUT, INSADD,
                NXTADDR,
                BR);

    initial begin
        // INSADD = 16'd0;
        // #10;
        // INSREAD = 1; WIR = 1;
        // //#20; INSREAD = 0; WIR = 0; //RIR = 1;
        // #10;
        // INSADD = 16'd1; INSREAD = 0; WIR = 0;
        // #10;
        // INSREAD = 1; WIR = 1; //RIR = 0;
        // //#20; INSREAD = 0; WIR = 0; //RIR = 1;
        // #10;
        // INSADD = 16'd2; INSREAD = 0; WIR = 0;
        // #10;
        // INSREAD = 1; WIR = 1;  //RIR = 0;
        // //#20; INSREAD = 0; WIR = 0; //RIR = 1;
        // #30;
        Z = 0; BIN = 16'b0;
        #800;
        $finish;
    end    

endmodule //IRandIM_testbench