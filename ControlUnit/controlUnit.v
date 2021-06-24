// control unit of the processor
module controlUnit (input clk, Z,
                    input [15:0] IR,
                    output	BR,
							MEMREAD, MEMWR,
							INSREAD,
							WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
							RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
							LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
							ALUOP, R2INC, PCINC,
							RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
					output 	[2:0]	ALUMUX, ALUCTRL);

    /*
    ------ Inputs ------
    clk = clock, Z = zero flag, IR = instruction register

    ------ Outputs ------
    BR = branch, MEMREAD = memory read, MEMWR = memory write, INSREAD = instruction read,
    WXX = write to register (XX)
    RXX = read from register (XX)
    LDALUXX = load register (XX) to ALU
    ALUOP = take the ALU output, R2INC = increment R2, PCINC = increment PC
    RSTRX = reset register (RX)
    ALUMUX = select input to ALU
    ALUCTRL = select ALU operation
    */

    wire BR;
    wire [4:0] NXTADDR;
    wire [34:0] ROMOUT;

    // MAP, logic and ROM
    ctrlu_top logicandROM(clk, BR, Z, IR[15:8], NXTADDR, ROMOUT);
    // Microinstructions register
    controlSignals ctrlSignals(clk, ROMOUT, IR[7:4], IR[3:0], BR,
                                MEMREAD, MEMWR, INSREAD,
                                WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
                                RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                                LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                                ALUOP, R2INC, PCINC,
                                RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
                                ALUMUX, ALUCTRL, NXTADDR);

endmodule //controlUnit