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
        MADDR1 = (16'd0 << 2) + 16'd0; MADDR2 = (16'd0 << 2) + 16'd0; MADDR3 = (16'd0 << 2) + 16'd1; MADDR4 = (16'd0 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd1) $display("Core 1 M1-element1 data fetched");
		if(DOUT2 === 16'd1) $display("Core 2 M1-element1 data fetched");
		if(DOUT3 === 16'd5) $display("Core 3 M1-element1 data fetched");
		if(DOUT4 === 16'd5) $display("Core 4 M1-element1 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd1 << 2) + 16'd0; MADDR2 = (16'd1 << 2) + 16'd1; MADDR3 = (16'd1 << 2) + 16'd0; MADDR4 = (16'd1 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd1) $display("Core 1 M2-element1 data fetched");
		if(DOUT2 === 16'd2) $display("Core 2 M2-element1 data fetched");
		if(DOUT3 === 16'd1) $display("Core 3 M2-element1 data fetched");
		if(DOUT4 === 16'd2) $display("Core 4 M2-element1 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd2 << 2) + 16'd0; MADDR2 = (16'd2 << 2) + 16'd0; MADDR3 = (16'd2 << 2) + 16'd1; MADDR4 = (16'd2 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd2) $display("Core 1 M1-element2 data fetched");
		if(DOUT2 === 16'd2) $display("Core 2 M1-element2 data fetched");
		if(DOUT3 === 16'd6) $display("Core 3 M1-element2 data fetched");
		if(DOUT4 === 16'd6) $display("Core 4 M1-element2 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd3 << 2) + 16'd0; MADDR2 = (16'd3 << 2) + 16'd1; MADDR3 = (16'd3 << 2) + 16'd0; MADDR4 = (16'd3 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd5) $display("Core 1 M2-element2 data fetched");
		if(DOUT2 === 16'd6) $display("Core 2 M2-element2 data fetched");
		if(DOUT3 === 16'd5) $display("Core 3 M2-element2 data fetched");
		if(DOUT4 === 16'd6) $display("Core 4 M2-element2 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd4 << 2) + 16'd0; MADDR2 = (16'd4 << 2) + 16'd0; MADDR3 = (16'd4 << 2) + 16'd1; MADDR4 = (16'd4 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd3) $display("Core 1 M1-element3 data fetched");
		if(DOUT2 === 16'd3) $display("Core 2 M1-element3 data fetched");
		if(DOUT3 === 16'd7) $display("Core 3 M1-element3 data fetched");
		if(DOUT4 === 16'd7) $display("Core 4 M1-element3 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd5 << 2) + 16'd0; MADDR2 = (16'd5 << 2) + 16'd1; MADDR3 = (16'd5 << 2) + 16'd0; MADDR4 = (16'd5 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
		if(DOUT1 === 16'd9) $display("Core 1 M2-element3 data fetched");
		if(DOUT2 === 16'd10) $display("Core 2 M2-element3 data fetched");
		if(DOUT3 === 16'd9) $display("Core 3 M2-element3 data fetched");
		if(DOUT4 === 16'd10) $display("Core 4 M2-element3 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd6 << 2) + 16'd0; MADDR2 = (16'd6 << 2) + 16'd0; MADDR3 = (16'd6 << 2) + 16'd1; MADDR4 = (16'd6 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
        if(DOUT1 === 16'd4) $display("Core 1 M1-element4 data fetched");
		if(DOUT2 === 16'd4) $display("Core 2 M1-element4 data fetched");
		if(DOUT3 === 16'd8) $display("Core 3 M1-element4 data fetched");
		if(DOUT4 === 16'd8) $display("Core 4 M1-element4 data fetched");

        #15; MR = 4'b0;
        #10;
        MADDR1 = (16'd7 << 2) + 16'd0; MADDR2 = (16'd7 << 2) + 16'd1; MADDR3 = (16'd7 << 2) + 16'd0; MADDR4 = (16'd7 << 2) + 16'd1;
        #10; MR = 4'b1111; #5;
		if(DOUT1 === 16'd13) $display("Core 1 M2-element4 data fetched");
		if(DOUT2 === 16'd14) $display("Core 2 M2-element4 data fetched");
		if(DOUT3 === 16'd13) $display("Core 3 M2-element4 data fetched");
		if(DOUT4 === 16'd14) $display("Core 4 M2-element4 data fetched");

        #50;
        $finish;
    end

endmodule //dataCtrlandDM_testbench