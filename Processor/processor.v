module processor (input clk,
                input [15:0] DIN,
                output [15:0] DMADDR, DOUT,
                output MEMREAD, MEMWR);

    wire [15:0] INSIN, IMADDR;
    wire INSREAD;

    core #(0,0) core1(clk, INSIN, DIN,
                    DMADDR, IMADDR, DOUT,
                    MEMREAD, MEMWR, INSREAD);

    ram_instruction instructionMemory(INSIN, IMADDR, INSREAD, clk);

endmodule //processor