`timescale 1ns/1ps
module registerFile_testbench ();

    reg clk, MEMREAD;
    reg WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
		RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
        LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
        RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
        R2INC, PCINC;
    reg [2:0] ALUMUX;
    reg [15:0] INSIN, DIN, BIN;
    wire [15:0] DMADDR, IMADDR, DOUT, ACOUT, ALUOUT, BOUT, IROUT;

    // device under test
    registerFile dut(clk, MEMREAD,
                    WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
		            RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
                    LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
                    RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
                    R2INC, PCINC,
                    ALUMUX,
                    INSIN, DIN, BIN,
                    DMADDR, IMADDR, DOUT, ACOUT, ALUOUT, BOUT, IROUT);
    
    // generate clock
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    initial begin
			MEMREAD = 0;
        // testing read/write register
        #10;
        BIN = 16'd12; WAC = 1; #20;
        RAC = 1; #2;
        if (BOUT !== 16'd12)
            $display("Failed AC write/read");

        #18;
        RAC = 0; WAC = 0;
        BIN = 16'd20; WAR = 1; #20;
        #2;
        if (DMADDR !== 16'd20)
            $display("Failed AR write/read");

        #18;
        WAR = 0;
        BIN = 16'd24; WDR = 1; #20;
        RDR = 1; #2;
        if (BOUT !== 16'd24)
            $display("Failed DR write/read");

        // ALU load
        #18;
        WDR = 0; RDR = 0;
        LDALUAC = 1; #2;
        if (ACOUT !== 16'd12)
            $display("Failed ALUAC load");

        // DOUT check
        #18;
        LDALUAC = 0;
        #2;
        if (DOUT !== 16'd24)
            $display("Failed DOUT");

        
        // Read/ write IR, PC, R2
        #18;
        INSIN = 16'd212; WIR = 1; #20;
        RIR = 1; #2;
        if (BOUT !== 16'd212)
            $display("Failed IR write/read");

        #18;
        RIR = 0; WIR = 0;
        BIN = 16'd220; WPC = 1; #20;
        #2;
        if (IMADDR !== 16'd220)
            $display("Failed PC write/read");

        #18;
        WPC = 0;
        BIN = 16'd224; WR2 = 1; #20;
        RR2 = 1; #2;
        if (BOUT !== 16'd224)
            $display("Failed R2 write/read");

        // Read/Write R1, R3
        #18;
        WR2 = 0; RR2 = 0;
        BIN = 16'd228; WR1 = 1; #20;
        RR1 = 1; #2;
        if (BOUT !== 16'd228)
            $display("Failed R1 write/read");

        #18;
        WR1 = 0; RR1 = 0;
        BIN = 16'd232; WR3 = 1; #20;
        RR3 = 1; #2;
        if (BOUT !== 16'd232)
            $display("Failed R3 write/read");

        // ALU load and IR to CU
        #18;
        WR3 = 0; RR3 = 0;
        LDALUIR = 1; ALUMUX = 3'b001; #2;
        if (ALUOUT !== 16'd212)
            $display("Failed ALUIR load");
        if (IROUT !== 16'd212)
            $display("Failed IR to CU load");

        // PC INC
        #18;
        LDALUIR = 0;
        PCINC = 1; #20;
        #2;
        if (IMADDR !== 16'd221)
            $display("Failed PCINC");

        // R2 INC and RST
        #18;
        PCINC = 0;
        R2INC = 1; #20;
        RR2 = 1; #2;
        if (BOUT !== 16'd225)
            $display("Failed R2INC");

        #18;
        R2INC = 0; RR2 = 0;
        RSTR2 = 1; #20;
        RR2 = 1; #2;
        if (BOUT !== 16'd0)
            $display("Failed RSTR2");

        // ALU load for R1
        #18;
        RSTR2 = 0; RR2 = 0;
        LDALUR1 = 1; ALUMUX = 3'b100; #2;
        if (ALUOUT !== 16'd228)
            $display("Failed ALUR1 load");

        // Test for Reset in R1 and R3
        #18;
        LDALUR1 = 0;
        RSTR1 = 1; #20;
        RR1 = 1; #2;
        if (BOUT !== 16'd0)
            $display("Failed RSTR1");       
        
        #18;
        RSTR1 = 0; RR1 = 0;
        RSTR3 = 1; #20;
        RR3 = 1; #2;
        if (BOUT !== 16'd0)
            $display("Failed RSTR3");   
        $finish;
    end

endmodule //registerFile_testbench