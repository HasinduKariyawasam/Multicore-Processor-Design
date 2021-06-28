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
                output wire Z);

    //wire [15:0] IMADDR;
    //wire INSREAD;

    core #(0,0) core1(clk, INSIN, DIN,
                    DMADDR, IMADDR, DOUT,
                    MEMREAD, MEMWR, INSREAD, NXTADDR, BR, ALUOP, IROUT, ALUOUT, ACOUT, ALUIN,
                    BIN, BOUT, ALUMUX, ALUCTRL, Z);

    ram_instruction instructionMemory(INSIN, IMADDR, INSREAD, clk);

    ram_data dataMemory(DIN, DMADDR, DOUT, MEMWR, MEMREAD, clk);

endmodule //processor