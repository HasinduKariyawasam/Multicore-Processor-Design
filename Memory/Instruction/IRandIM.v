module IRandIM (input clk, Z, 
                input [15:0] BIN,
                output MEMREAD, MEMWR,
                        WAR, WDR, WPC, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
						RAR, RDR, RPC, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                        LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                        ALUOP, R2INC, PCINC,
                        RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
                output 	[2:0]	ALUMUX, ALUCTRL,
                output wire INSREAD, WIR, RIR, LDALUIR,
                output wire [15:0] INSIN, BOUT, ALUOUT, IROUT, INSADD,
                output wire [4:0] NXTADDR,
                output wire BR);

    //IR
    IR IR(clk, INSIN, WIR, RIR, LDALUIR, BOUT, ALUOUT, IROUT);

    //PC
    PC_register PC(BIN, clk, WPC, PCINC, INSADD);

    //IR Memory
    ram_instruction IRMEM(INSIN, INSADD, INSREAD, clk); 

    //Control unit
    controlUnit controlUnit(clk, Z,
                            IROUT,
                            MEMREAD, MEMWR,
                            INSREAD,
                            WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
							RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                            LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                            ALUOP, R2INC, PCINC,
                            RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
                            ALUMUX, ALUCTRL,
                            NXTADDR,
                            BR);

endmodule //IRandIM