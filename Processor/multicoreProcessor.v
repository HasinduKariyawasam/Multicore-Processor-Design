module multicoreProcessor (input clk, input [4:0] numCores); // , output dmWR

    wire [15:0] INSIN;
    wire [15:0] DATAIN1, DATAIN2, DATAIN3, DATAIN4, DATAIN5, DATAIN6, DATAIN7, DATAIN8,
                DATAIN9, DATAIN10, DATAIN11, DATAIN12, DATAIN13, DATAIN14, DATAIN15, DATAIN16;
    wire [15:0] DMADDR1, DMADDR2, DMADDR3, DMADDR4, DMADDR5, DMADDR6, DMADDR7, DMADDR8,
                DMADDR9, DMADDR10, DMADDR11, DMADDR12, DMADDR13, DMADDR14, DMADDR15, DMADDR16;
    wire [15:0] IMADDR1, IMADDR2, IMADDR3, IMADDR4, IMADDR5, IMADDR6, IMADDR7, IMADDR8,
                IMADDR9, IMADDR10, IMADDR11, IMADDR12, IMADDR13, IMADDR14, IMADDR15, IMADDR16;
    wire [15:0] IMAR1, IMAR2, IMAR3, IMAR4, IMAR5, IMAR6, IMAR7, IMAR8, IMAR9, IMAR10, IMAR11, 
                IMAR12, IMAR13, IMAR14, IMAR15, IMAR16;
    wire [15:0] DATAOUT1, DATAOUT2, DATAOUT3, DATAOUT4, DATAOUT5, DATAOUT6, DATAOUT7, DATAOUT8, 
                DATAOUT9, DATAOUT10, DATAOUT11, DATAOUT12, DATAOUT13, DATAOUT14, DATAOUT15, DATAOUT16;
    wire MEMREAD1, MEMREAD2, MEMREAD3, MEMREAD4, MEMREAD5, MEMREAD6, MEMREAD7, MEMREAD8, MEMREAD9, 
         MEMREAD10, MEMREAD11, MEMREAD12, MEMREAD13, MEMREAD14, MEMREAD15, MEMREAD16;
    wire MEMR1, MEMR2, MEMR3, MEMR4, MEMR5, MEMR6, MEMR7, MEMR8, MEMR9, MEMR10, MEMR11, MEMR12, 
         MEMR13, MEMR14, MEMR15, MEMR16;
    wire MEMWR1, MEMWR2, MEMWR3, MEMWR4, MEMWR5, MEMWR6, MEMWR7, MEMWR8, MEMWR9, MEMWR10, MEMWR11, 
         MEMWR12, MEMWR13, MEMWR14, MEMWR15, MEMWR16;
    wire MEMW1, MEMW2, MEMW3, MEMW4, MEMW5, MEMW6, MEMW7, MEMW8, MEMW9, MEMW10, MEMW11, MEMW12, 
         MEMW13, MEMW14, MEMW15, MEMW16;
    wire INSREAD1, INSREAD2, INSREAD3, INSREAD4, INSREAD5, INSREAD6, INSREAD7, INSREAD8, INSREAD9, 
         INSREAD10, INSREAD11, INSREAD12, INSREAD13, INSREAD14, INSREAD15, INSREAD16;
    wire INSR1, INSR2, INSR3, INSR4, INSR5, INSR6, INSR7, INSR8, INSR9, INSR10, INSR11, INSR12, 
         INSR13, INSR14, INSR15, INSR16;
    wire OPEND1, OPEND2, OPEND3, OPEND4, OPEND5, OPEND6, OPEND7, OPEND8, OPEND9, OPEND10, OPEND11, 
         OPEND12, OPEND13, OPEND14, OPEND15, OPEND16;
    wire OPE1, OPE2, OPE3, OPE4, OPE5, OPE6, OPE7, OPE8, OPE9, OPE10, OPE11, OPE12, OPE13, OPE14, 
         OPE15, OPE16;
    wire [63:0] datafromMem, datatoMem;
    wire memWR, memREAD;
    wire [15:0] memAddr;
    wire [15:0] INSADDR;
    wire IMREAD;

    wire [15:0] en;
    wire clk1, clk2, clk3, clk4, clk5, clk6, clk7, clk8, clk9, clk10, clk11, clk12, clk13, clk14, 
         clk15, clk16;
     
     // wr signal for data memory
     // assign dmWR = memWR;


    // clock gating
    assign clk1 = en[0] ? clk: 0;
    assign clk2 = en[1] ? clk: 0;
    assign clk3 = en[2] ? clk: 0;
    assign clk4 = en[3] ? clk: 0;
    assign clk5 = en[4] ? clk: 0;
    assign clk6 = en[5] ? clk: 0;
    assign clk7 = en[6] ? clk: 0;
    assign clk8 = en[7] ? clk: 0;
    assign clk9 = en[8] ? clk: 0;
    assign clk10 = en[9] ? clk: 0;
    assign clk11 = en[10] ? clk: 0;
    assign clk12 = en[11] ? clk: 0;
    assign clk13 = en[12] ? clk: 0;
    assign clk14 = en[13] ? clk: 0;
    assign clk15 = en[14] ? clk: 0;
    assign clk16 = en[15] ? clk: 0;

    assign MEMREAD1	  =  en[0] ? MEMR1 : 1;
    assign MEMREAD2	  =  en[1] ? MEMR2 : 1;
    assign MEMREAD3	  =  en[2] ? MEMR3 : 1;
    assign MEMREAD4	  =  en[3] ? MEMR4 : 1;
    assign MEMREAD5	  =  en[4] ? MEMR5 : 1;
    assign MEMREAD6	  =  en[5] ? MEMR6 : 1;
    assign MEMREAD7	  =  en[6] ? MEMR7 : 1;
    assign MEMREAD8	  =  en[7] ? MEMR8 : 1;
    assign MEMREAD9	  =  en[8] ? MEMR9 : 1;
    assign MEMREAD10  =  en[9] ? MEMR10: 1;
    assign MEMREAD11  = en[10] ? MEMR11: 1;
    assign MEMREAD12  = en[11] ? MEMR12: 1;
    assign MEMREAD13  = en[12] ? MEMR13: 1;
    assign MEMREAD14  = en[13] ? MEMR14: 1;
    assign MEMREAD15  = en[14] ? MEMR15: 1;
    assign MEMREAD16  = en[15] ? MEMR16: 1;

    assign MEMWR1	=  en[0] ? MEMW1 : 1;
    assign MEMWR2	=  en[1] ? MEMW2 : 1;
    assign MEMWR3	=  en[2] ? MEMW3 : 1;
    assign MEMWR4	=  en[3] ? MEMW4 : 1;
    assign MEMWR5	=  en[4] ? MEMW5 : 1;
    assign MEMWR6	=  en[5] ? MEMW6 : 1;
    assign MEMWR7	=  en[6] ? MEMW7 : 1;
    assign MEMWR8	=  en[7] ? MEMW8 : 1;
    assign MEMWR9	=  en[8] ? MEMW9 : 1;
    assign MEMWR10  =  en[9] ? MEMW10: 1;
    assign MEMWR11  = en[10] ? MEMW11: 1;
    assign MEMWR12  = en[11] ? MEMW12: 1;
    assign MEMWR13  = en[12] ? MEMW13: 1;
    assign MEMWR14  = en[13] ? MEMW14: 1;
    assign MEMWR15  = en[14] ? MEMW15: 1;
    assign MEMWR16  = en[15] ? MEMW16: 1;

    assign INSREAD1	  =  en[0] ? INSR1 : 1;
    assign INSREAD2	  =  en[1] ? INSR2 : 1;
    assign INSREAD3	  =  en[2] ? INSR3 : 1;
    assign INSREAD4	  =  en[3] ? INSR4 : 1;
    assign INSREAD5	  =  en[4] ? INSR5 : 1;
    assign INSREAD6	  =  en[5] ? INSR6 : 1;
    assign INSREAD7	  =  en[6] ? INSR7 : 1;
    assign INSREAD8	  =  en[7] ? INSR8 : 1;
    assign INSREAD9	  =  en[8] ? INSR9 : 1;
    assign INSREAD10  =  en[9] ? INSR10: 1;
    assign INSREAD11  = en[10] ? INSR11: 1;
    assign INSREAD12  = en[11] ? INSR12: 1;
    assign INSREAD13  = en[12] ? INSR13: 1;
    assign INSREAD14  = en[13] ? INSR14: 1;
    assign INSREAD15  = en[14] ? INSR15: 1;
    assign INSREAD16  = en[15] ? INSR16: 1;

    assign IMADDR1	  =  en[0] ? IMAR1 : 16'b1111111111111111;
    assign IMADDR2	  =  en[1] ? IMAR2 : 16'b1111111111111111;
    assign IMADDR3	  =  en[2] ? IMAR3 : 16'b1111111111111111;
    assign IMADDR4	  =  en[3] ? IMAR4 : 16'b1111111111111111;
    assign IMADDR5	  =  en[4] ? IMAR5 : 16'b1111111111111111;
    assign IMADDR6	  =  en[5] ? IMAR6 : 16'b1111111111111111;
    assign IMADDR7	  =  en[6] ? IMAR7 : 16'b1111111111111111;
    assign IMADDR8	  =  en[7] ? IMAR8 : 16'b1111111111111111;
    assign IMADDR9	  =  en[8] ? IMAR9 : 16'b1111111111111111;
    assign IMADDR10   =  en[9] ? IMAR10: 16'b1111111111111111;
    assign IMADDR11   = en[10] ? IMAR11: 16'b1111111111111111;
    assign IMADDR12   = en[11] ? IMAR12: 16'b1111111111111111;
    assign IMADDR13   = en[12] ? IMAR13: 16'b1111111111111111;
    assign IMADDR14   = en[13] ? IMAR14: 16'b1111111111111111;
    assign IMADDR15   = en[14] ? IMAR15: 16'b1111111111111111;
    assign IMADDR16   = en[15] ? IMAR16: 16'b1111111111111111;

    assign OPEND1	 = en[0] ? OPE1 : 1;
    assign OPEND2	 = en[1] ? OPE2 : 1;
    assign OPEND3	 = en[2] ? OPE3 : 1;
    assign OPEND4	 = en[3] ? OPE4 : 1;
    assign OPEND5	 = en[4] ? OPE5 : 1;
    assign OPEND6	 = en[5] ? OPE6 : 1;
    assign OPEND7	 = en[6] ? OPE7 : 1;
    assign OPEND8	 = en[7] ? OPE8 : 1;
    assign OPEND9	 = en[8] ? OPE9 : 1;
    assign OPEND10   = en[9] ? OPE10: 1;
    assign OPEND11   = en[10] ? OPE11: 1;
    assign OPEND12   = en[11] ? OPE12: 1;
    assign OPEND13   = en[12] ? OPE13: 1;
    assign OPEND14   = en[13] ? OPE14: 1;
    assign OPEND15   = en[14] ? OPE15: 1;
    assign OPEND16   = en[15] ? OPE16: 1;

    // enable decoder
    enableDecoder enableDecoder(numCores, en[0], en[1], en[2], en[3], en[4],
                                en[5], en[6], en[7], en[8], en[9], en[10], en[11],
                                en[12], en[13], en[14], en[15]);

    // 16 cores
    core #(0,0) core1(clk1, INSIN, DATAIN1, DMADDR1, IMAR1, DATAOUT1,
                      MEMR1, MEMW1, INSR1, OPE1);

    core #(0,1) core2(clk2, INSIN, DATAIN2, DMADDR2, IMAR2, DATAOUT2,
                      MEMR2, MEMW2, INSR2, OPE2);

    core #(0,2) core3(clk3, INSIN, DATAIN3, DMADDR3, IMAR3, DATAOUT3,
                      MEMR3, MEMW3, INSR3, OPE3);

    core #(0,3) core4(clk4, INSIN, DATAIN4, DMADDR4, IMAR4, DATAOUT4,
                      MEMR4, MEMW4, INSR4, OPE4);

    core #(1,0) core5(clk5, INSIN, DATAIN5, DMADDR5, IMAR5, DATAOUT5,
                      MEMR5, MEMW5, INSR5, OPE5);

    core #(1,1) core6(clk6, INSIN, DATAIN6, DMADDR6, IMAR6, DATAOUT6,
                      MEMR6, MEMW6, INSR6, OPE6);

    core #(1,2) core7(clk7, INSIN, DATAIN7, DMADDR7, IMAR7, DATAOUT7,
                      MEMR7, MEMW7, INSR7, OPE7);

    core #(1,3) core8(clk8, INSIN, DATAIN8, DMADDR8, IMAR8, DATAOUT8,
                      MEMR8, MEMW8, INSR8, OPE8);

    core #(2,0) core9(clk9, INSIN, DATAIN9, DMADDR9, IMAR9, DATAOUT9,
                      MEMR9, MEMW9, INSR9, OPE9);

    core #(2,1) core10(clk10, INSIN, DATAIN10, DMADDR10, IMAR10, DATAOUT10,
                      MEMR10, MEMW10, INSR10, OPE10);

    core #(2,2) core11(clk11, INSIN, DATAIN11, DMADDR11, IMAR11, DATAOUT11,
                      MEMR11, MEMW11, INSR11, OPE11);

    core #(2,3) core12(clk12, INSIN, DATAIN12, DMADDR12, IMAR12, DATAOUT12,
                      MEMR12, MEMW12, INSR12, OPE12);

    core #(3,0) core13(clk13, INSIN, DATAIN13, DMADDR13, IMAR13, DATAOUT13,
                      MEMR13, MEMW13, INSR13, OPE13);

    core #(3,1) core14(clk14, INSIN, DATAIN14, DMADDR14, IMAR14, DATAOUT14,
                      MEMR14, MEMW14, INSR14, OPE14);

    core #(3,2) core15(clk15, INSIN, DATAIN15, DMADDR15, IMAR15, DATAOUT15,
                      MEMR15, MEMW15, INSR15, OPE15);

    core #(3,3) core16(clk16, INSIN, DATAIN16, DMADDR16, IMAR16, DATAOUT16,
                      MEMR16, MEMW16, INSR16, OPE16);

    // memory controller
    MemoryController memoryControl(clk, en[0], en[1], en[2], en[3], en[4], en[5], en[6], en[7], en[8], en[9], en[10], en[11],
                                   en[12], en[13], en[14], en[15], 
                                   OPEND1, OPEND2, OPEND3, OPEND4, OPEND5, OPEND6, OPEND7, OPEND8, OPEND9, OPEND10, OPEND11, 
                                   OPEND12, OPEND13, OPEND14, OPEND15, OPEND16,
                                   DMADDR1, DMADDR2, DMADDR3, DMADDR4, DMADDR5, DMADDR6, DMADDR7, DMADDR8,
                                   DMADDR9, DMADDR10, DMADDR11, DMADDR12, DMADDR13, DMADDR14, DMADDR15, DMADDR16,
                                   DATAOUT1, DATAOUT2, DATAOUT3, DATAOUT4, DATAOUT5, DATAOUT6, DATAOUT7, DATAOUT8, 
                                   DATAOUT9, DATAOUT10, DATAOUT11, DATAOUT12, DATAOUT13, DATAOUT14, DATAOUT15, DATAOUT16,
                                   MEMWR1, MEMWR2, MEMWR3, MEMWR4, MEMWR5, MEMWR6, MEMWR7, MEMWR8, MEMWR9, MEMWR10, MEMWR11, 
                                   MEMWR12, MEMWR13, MEMWR14, MEMWR15, MEMWR16,
                                   MEMREAD1, MEMREAD2, MEMREAD3, MEMREAD4, MEMREAD5, MEMREAD6, MEMREAD7, MEMREAD8, MEMREAD9, 
                                   MEMREAD10, MEMREAD11, MEMREAD12, MEMREAD13, MEMREAD14, MEMREAD15, MEMREAD16,
                                   datafromMem, memWR, memREAD, memAddr,
                                   DATAIN1, DATAIN2, DATAIN3, DATAIN4, DATAIN5, DATAIN6, DATAIN7, DATAIN8,
                                   DATAIN9, DATAIN10, DATAIN11, DATAIN12, DATAIN13, DATAIN14, DATAIN15, DATAIN16,
                                   datatoMem);

    // data memory
    ram_data dataMemory(datafromMem, memAddr, datatoMem, memWR, memREAD, clk);

    // instruction memory interface
    INS_Ctrl IMInterface(IMADDR1, IMADDR2, IMADDR3, IMADDR4, IMADDR5, IMADDR6, IMADDR7, IMADDR8,
                         IMADDR9, IMADDR10, IMADDR11, IMADDR12, IMADDR13, IMADDR14, IMADDR15, IMADDR16, 
                         INSREAD1, INSREAD2, INSREAD3, INSREAD4, INSREAD5, INSREAD6, INSREAD7, INSREAD8, INSREAD9, 
                         INSREAD10, INSREAD11, INSREAD12, INSREAD13, INSREAD14, INSREAD15, INSREAD16,
                         INSADDR, IMREAD);

    // instruction memory
    ram_instruction instructionMemory(INSIN, INSADDR, IMREAD, clk);


endmodule //quadcoreProcessor