module core #(parameter [15:0] X = 16'b0,
            parameter [15:0] Y = 16'b0)
            (input clk,     
            input [15:0] INSIN, DIN,
            output [15:0] DMADDR, IMADDR, DOUT,
            output wire MEMREAD, 
            output MEMWR, INSREAD,
            output wire [4:0] NXTADDR,
            output wire BR,
            output wire [15:0] IROUT, ALUOUT, ACOUT, ALUIN,
            output wire [2:0] ALUMUX, ALUCTRL);
    
    wire WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
		RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
        LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
        RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7, RSTAR, RSTDR, RSTAC,
        ALUOP, R2INC, PCINC,
        Z;
    //wire [2:0] ALUMUX, ALUCTRL; //test
    wire [15:0] BIN, BOUT;// ACOUT, ALUIN, ALUOUT; //, IROUT test

    registerFile #(X,Y) registerFile(clk, MEMREAD,
                             WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
					        RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                            LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                            RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7, RSTAR, RSTDR, RSTAC,
                            R2INC, PCINC,
                            ALUMUX,
                            INSIN, DIN, BIN,
                            DMADDR, IMADDR, DOUT, ACOUT, ALUIN, BOUT, IROUT);
    
    ALU ALU(ACOUT, ALUIN, ALUCTRL, ALUOUT, Z);

    ALU_OP ALU_OP(ALUOP, ALUOUT, BOUT, BIN);

    controlUnit controlUnit(clk, Z,
                            IROUT,
                            MEMREAD, MEMWR, INSREAD,
                            WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
                            RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                            LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                            ALUOP, R2INC, PCINC,
                            RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7, RSTAR, RSTDR, RSTAC,
                            ALUMUX, ALUCTRL,
                            NXTADDR, BR);

endmodule //core