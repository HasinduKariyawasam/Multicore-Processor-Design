module processor (input clk,
                output wire [15:0] DIN,
                output wire [15:0] DMADDR, DOUT,
                output MEMREAD, MEMWR,
                output wire [15:0] INSIN, IMADDR, 
                output wire INSREAD,
                output wire [4:0] NXTADDR,
                output wire BR, ALUOP,
                output wire [15:0] IROUT, ALUOUT, ACOUT, ALUIN, BIN, BOUT,
                output wire [2:0] ALUMUX, ALUCTRL,
                output wire Z, Z_2);

    //wire [15:0] IMADDR;
    //wire INSREAD;
    wire [15:0] DIN_2, DMADDR_2, IMADDR_2, DOUT_2, IROUT_2, ALUOUT_2, ACOUT_2, ALUIN_2,
                    BIN_2, BOUT_2;
    wire MEMREAD_2, MEMWR_2, INSREAD_2, BR_2;
    wire [4:0] NXTADDR_2;
    wire [2:0] ALUMUX_2, ALUCTRL_2;

    core #(0,0) core1(clk, INSIN, DIN,
                    DMADDR, IMADDR, DOUT,
                    MEMREAD, MEMWR, INSREAD, NXTADDR, BR, ALUOP, IROUT, ALUOUT, ACOUT, ALUIN,
                    BIN, BOUT, ALUMUX, ALUCTRL, Z);
    
    core #(0,1) core2(clk, INSIN, DIN_2,
                    DMADDR_2, IMADDR_2, DOUT_2,
                    MEMREAD_2, MEMWR_2, INSREAD_2, NXTADDR_2, BR_2, ALUOP_2, IROUT_2, ALUOUT_2, ACOUT_2, ALUIN_2,
                    BIN_2, BOUT_2, ALUMUX_2, ALUCTRL_2, Z_2);

    ram_instruction instructionMemory(INSIN, IMADDR, INSREAD, clk);

    ram_data dataMemory(DIN, DMADDR, DOUT, MEMWR, MEMREAD,
                        DIN_2, DMADDR_2, DOUT_2, MEMWR_2, MEMREAD_2, 
                        clk);

endmodule //processor