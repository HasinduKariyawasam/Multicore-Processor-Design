module IRandIM (input clk, INSREAD, WIR, RIR, LDALUIR,
                input [15:0] INSADD,
                output wire [15:0] INSIN, BOUT, ALUOUT, IROUT);

    //IR
    IR IR(clk, INSIN, WIR, RIR, LDALUIR, BOUT, ALUOUT, IROUT);

    //IR Memory
    ram_instruction IRMEM(INSIN, INSADD, INSREAD, clk); 

endmodule //IRandIM