module quadcoreProcessor (input clk, input [4:0] numCores);

    wire [15:0] INSIN;
    wire [15:0] DATAIN1, DATAIN2, DATAIN3, DATAIN4;
    wire [15:0] DMADDR1, DMADDR2, DMADDR3, DMADDR4;
    wire [15:0] IMADDR1, IMADDR2, IMADDR3, IMADDR4;
    wire [15:0] IMAR1, IMAR2, IMAR3, IMAR4;
    wire [15:0] DATAOUT1, DATAOUT2, DATAOUT3, DATAOUT4;
    wire MEMREAD1, MEMREAD2, MEMREAD3, MEMREAD4;
    wire MEMR1, MEMR2, MEMR3, MEMR4;
    wire MEMWR1, MEMWR2, MEMWR3, MEMWR4;
    wire MEMW1, MEMW2, MEMW3, MEMW4;
    wire INSREAD1, INSREAD2, INSREAD3, INSREAD4;
    wire INSR1, INSR2, INSR3, INSR4;
    wire OPEND1, OPEND2, OPEND3, OPEND4;
    wire OPE1, OPE2, OPE3, OPE4;
    wire [63:0] datafromMem, datatoMem;
    wire memWR, memREAD;
    wire [15:0] memAddr;
    wire [15:0] INSADDR;
    wire IMREAD;

    wire [15:0] en;
    wire clk1, clk2, clk3, clk4;

    // clock gating
    assign clk1 = en[0] ? clk: 0;
    assign clk2 = en[1] ? clk: 0;
    assign clk3 = en[4] ? clk: 0;
    assign clk4 = en[5] ? clk: 0;

    assign MEMREAD1 = en[0] ? MEMR1: 1;
    assign MEMREAD2 = en[1] ? MEMR2: 1;
    assign MEMREAD3 = en[4] ? MEMR3: 1;
    assign MEMREAD4 = en[5] ? MEMR4: 1;

    assign MEMWR1 = en[0] ? MEMW1: 1;
    assign MEMWR2 = en[1] ? MEMW2: 1;
    assign MEMWR3 = en[4] ? MEMW3: 1;
    assign MEMWR4 = en[5] ? MEMW4: 1;

    assign INSREAD1 = en[0] ? INSR1: 1;
    assign INSREAD2 = en[1] ? INSR2: 1;
    assign INSREAD3 = en[4] ? INSR3: 1;
    assign INSREAD4 = en[5] ? INSR4: 1;

    assign IMADDR1 = en[0] ? IMAR1: 16'b1111111111111111;
    assign IMADDR2 = en[1] ? IMAR2: 16'b1111111111111111;
    assign IMADDR3 = en[4] ? IMAR3: 16'b1111111111111111;
    assign IMADDR4 = en[5] ? IMAR4: 16'b1111111111111111;

    assign OPEND1 = en[0] ? OPE1: 1;
    assign OPEND2 = en[1] ? OPE2: 1;
    assign OPEND3 = en[4] ? OPE3: 1;
    assign OPEND4 = en[5] ? OPE4: 1;

    // enable decoder
    enableDecoder enableDecoder(numCores, en[0], en[1], en[2], en[3], en[4],
                                en[5], en[6], en[7], en[8], en[9], en[10], en[11],
                                en[12], en[13], en[14], en[15]);

    // four cores
    core #(0,0) core1(clk1, INSIN, DATAIN1, DMADDR1, IMAR1, DATAOUT1,
                      MEMR1, MEMW1, INSR1, OPE1);

    core #(0,1) core2(clk2, INSIN, DATAIN2, DMADDR2, IMAR2, DATAOUT2,
                      MEMR2, MEMW2, INSR2, OPE2);

    core #(1,0) core3(clk3, INSIN, DATAIN3, DMADDR3, IMAR3, DATAOUT3,
                      MEMR3, MEMW3, INSR3, OPE3);

    core #(1,1) core4(clk4, INSIN, DATAIN4, DMADDR4, IMAR4, DATAOUT4,
                      MEMR4, MEMW4, INSR4, OPE4);

    // memory controller
    MemoryController memoryControl(clk, en[0], en[1], en[4], en[5], 
                                   OPEND1, OPEND2, OPEND3, OPEND4,
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