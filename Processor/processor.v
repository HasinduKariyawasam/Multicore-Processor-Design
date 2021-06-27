module processor (input clk,
                input [15:0] DIN,
                output [15:0] DMADDR, DOUT,
                output MEMREAD, MEMWR,
                output wire [15:0] INSIN, IMADDR, 
                output wire INSREAD,
                output wire [4:0] NXTADDR,
                output wire BR,
                output wire [15:0] IROUT, ALUOUT, ACOUT, ALUIN,
                output wire [2:0] ALUMUX, ALUCTRL);

    //wire [15:0] IMADDR;
    //wire INSREAD;

    core #(0,0) core1(clk, INSIN, DIN,
                    DMADDR, IMADDR, DOUT,
                    MEMREAD, MEMWR, INSREAD, NXTADDR, BR, IROUT, ALUOUT, ACOUT, ALUIN,
                    ALUMUX, ALUCTRL);

    ram_instruction instructionMemory(INSIN, IMADDR, INSREAD, clk);

endmodule //processor