module quadcoreProcessor (input clk);

    wire [15:0] INSIN;
    wire [15:0] DATAIN1, DATAIN2, DATAIN3, DATAIN4;
    wire [15:0] DMADDR1, DMADDR2, DMADDR3, DMADDR4;
    wire [15:0] IMADDR1, IMADDR2, IMADDR3, IMADDR4;
    wire [15:0] DATAOUT1, DATAOUT2, DATAOUT3, DATAOUT4;
    wire MEMREAD1, MEMREAD2, MEMREAD3, MEMREAD4;
    wire MEMWR1, MEMWR2, MEMWR3, MEMWR4;
    wire INSREAD1, INSREAD2, INSREAD3, INSREAD4;
    wire OPEND1, OPEND2, OPEND3, OPEND4;
    wire [63:0] datafromMem, datatoMem;
    wire memWR, memREAD;
    wire [15:0] memAddr;
    wire [15:0] INSADDR;
    wire IMREAD;

    wire [3:0] en;
    wire clk1, clk2, clk3, clk4;

    // clock gating
    always @(en) begin
        if (en[0]) clk1 = clk;
        else       clk1 = 0;
        if (en[1]) clk2 = clk;
        else       clk2 = 0;
        if (en[2]) clk3 = clk;
        else       clk3 = 0;
        if (en[3]) clk4 = clk;
        else       clk4 = 0;
    end

    // four cores
    core #(0,0) core1(clk1, INSIN, DATAIN1, DMADDR1, IMADDR1, DATAOUT1,
                      MEMREAD1, MEMWR1, INSREAD1, OPEND1);

    core #(0,1) core2(clk2, INSIN, DATAIN2, DMADDR2, IMADDR2, DATAOUT2,
                      MEMREAD2, MEMWR2, INSREAD2, OPEND2);

    core #(1,0) core3(clk3, INSIN, DATAIN3, DMADDR3, IMADDR3, DATAOUT3,
                      MEMREAD3, MEMWR3, INSREAD3, OPEND3);

    core #(1,1) core4(clk4, INSIN, DATAIN4, DMADDR4, IMADDR4, DATAOUT4,
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