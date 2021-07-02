module quadcoreProcessor (input clk);

    wire [15:0] INSIN;
    wire [15:0] DATAIN1, DATAIN2, DATAIN3, DATAIN4;
    wire [15:0] DMADDR1, DMADDR2, DMADDR3, DMADDR4;
    wire [15:0] IMADDR1, IMADDR2, IMADDR3, IMADDR4;
    wire [15:0] DATAOUT1, DATAOUT2, DATAOUT3, DATAOUT4;
    wire [15:0] MEMREAD1, MEMREAD2, MEMREAD3, MEMREAD4;
    wire [15:0] MEMWR1, MEMWR2, MEMWR3, MEMWR4;
    wire [15:0] INSREAD1, INSREAD2, INSREAD3, INSREAD4;
    wire [15:0] OPEND1, OPEND2, OPEND3, OPEND4;
    wire [63:0] datafromMem, datatoMem;
    wire memWR, memREAD;
    wire [15:0] memAddr;
    wire [15:0] INSADDR;
    wire IMREAD;

    // four cores
    core #(0,0) core1(clk, INSIN, DATAIN1, DMADDR1, IMADDR1, DATAOUT1,
                      MEMREAD1, MEMWR1, INSREAD1, OPEND1);

    core #(0,1) core2(clk, INSIN, DATAIN2, DMADDR2, IMADDR2, DATAOUT2,
                      MEMREAD2, MEMWR2, INSREAD2, OPEND2);

    core #(1,0) core3(clk, INSIN, DATAIN3, DMADDR3, IMADDR3, DATAOUT3,
                      MEMREAD3, MEMWR3, INSREAD3, OPEND3);

    core #(1,1) core4(clk, INSIN, DATAIN4, DMADDR4, IMADDR4, DATAOUT4,
                      MEMREAD4, MEMWR4, INSREAD4, OPEND4);

    // memory controller
    MemoryController memoryControl(clk, OPEND1, OPEND2, OPEND3, OPEND4,
                                   DMADDR1, DMADDR2, DMADDR3, DMADDR4,
                                   DATAOUT1, DATAOUT2, DATAOUT3, DATAOUT4,
                                   MEMWR1, MEMWR2, MEMWR3, MEMWR4,
                                   MEMREAD1, MEMREAD2, MEMREAD3, MEMREAD4,
                                   datafromMem, memWR, memREAD, memAddr,
                                   DATAIN1, DATAIN2, DATAIN3, DATAIN4,
                                   datatoMem);

    // data memory
    ram_data dataMemory(datafromMem, memAddr, datatoMem, memWR, memREAD, clk);

    // instruction memory interface
    INS_Ctrl IMInterface(IMADDR1, IMADDR2, IMADDR3, IMADDR4, 
                         INSREAD1, INSREAD2, INSREAD3, INSREAD4,
                         INSADDR, IMREAD);

    // instruction memory
    ram_instruction instructionMemory(INSIN, INSADDR, IMREAD, clk);


endmodule //quadcoreProcessor