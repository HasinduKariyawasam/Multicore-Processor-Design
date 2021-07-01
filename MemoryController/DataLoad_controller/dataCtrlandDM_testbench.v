module dataCtrlandDM_testbench ();

    reg clk, MEMWRITE;
    reg [3:0] MR;
    reg [15:0] MADDR1, MADDR2, MADDR3, MADDR4;
    reg [63:0] DATAIN;
    wire [15:0] DOUT1, DOUT2, DOUT3, DOUT4;

    // device under test
    dataCtrlandDM dut(clk, MEMWRITE, MR,
                    MADDR1, MADDR2, MADDR3, MADDR4, DATAIN,
                    DOUT1, DOUT2, DOUT3, DOUT4);

    // generate clock
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    // testing the dut
    initial begin
        MEMWRITE = 0; DATAIN = 64'b0;
        MR = 4'b0;
        #20;
        MADDR1 = 
    end

endmodule //dataCtrlandDM_testbench