module registerFile (input clk, MEMREAD, 
                            WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
							RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                            LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                            RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
                            R2INC, PCINC,
                    input [2:0] ALUMUX,
                    input [15:0] INSIN, DIN, BIN,
                    output [15:0] DMADDR, IMADDR, DOUT, ACOUT, ALUOUT, BOUT, IROUT);

    wire [15:0] IRALU, R5ALU, R1ALU, IDXALU, IDYALU, REGOUT;

    // ALUMUX
    ALU_MUX ALU_MUX(ALUMUX, IRALU, R5ALU, R1ALU, IDXALU, IDYALU, ALUOUT);

    // AC register
    RegAC AC(clk, BIN, WAC, RAC, LDALUAC, REGOUT, ACOUT);
    // AR register
    AR_register AR(BIN, clk, WAR, DMADDR);
    // DR register
    DR DR(clk, BIN, WDR, RDR, REGOUT, DOUT);
    // IR register
    IR IR(clk, INSIN, WIR, RIR, LDALUIR, REGOUT, IRALU, IROUT);
    // PC register
    PC_register PC(BIN, clk, WPC, PCINC, IMADDR);
    // R1 register
    Reg15 R1(clk, BIN, RSTR1, WR1, RR1, LDALUR1, REGOUT, R1ALU);
    // R2 register
    R2 R2(clk, BIN, RSTR2, WR2, RR2, R2INC, REGOUT);
    // R3 register
    R3467 R3(clk, BIN, RSTR3, WR3, RR3, REGOUT);
    // R4 register
    R3467 R4(clk, BIN, RSTR4, WR4, RR4, REGOUT);
    // R5 register
    Reg15 R5(clk, BIN, RSTR5, WR5, RR5, LDALUR5, REGOUT, R5ALU);
    // R6 register
    R3467 R6(clk, BIN, RSTR6, WR6, RR6, REGOUT);
    // R7 register
    R3467 R7(clk, BIN, RSTR7, WR7, RR7, REGOUT);
    // IDX register
    IDREG #(3) IDX(clk, LDALUIDX, IDXALU);
    // IDY register
    IDREG #(0) IDY(clk, LDALUIDY, IDYALU);

    assign BOUT = MEMREAD ? DIN: REGOUT;

endmodule //registerFile