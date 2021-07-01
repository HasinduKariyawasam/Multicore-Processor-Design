module dataCtrlandDM (input clk, MEMWRITE,
                        input [3:0] MR,
                        input [15:0] MADDR1, MADDR2, MADDR3, MADDR4,
                        input [63:0] DATAIN,
                        output [15:0] DOUT1, DOUT2, DOUT3, DOUT4);

    wire [63:0] DATAOUT;
    wire MEMREAD;
    wire [15:0] MEMADDR;

    DL_Controller DataLoad(DATAOUT, MR[3], MR[2], MR[1], MR[0],
                            MADDR1, MADDR2, MADDR3, MADDR4, MEMREAD, MEMADDR,
                            DOUT1, DOUT2, DOUT3, DOUT4);

    ram_data DM(DATAOUT, MEMADDR, DATAIN, MEMWRITE, MEMREAD, clk);

endmodule //dataCtrlandDM