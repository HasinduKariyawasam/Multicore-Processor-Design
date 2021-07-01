`timescale 1ns/1ps
module controlSignals_testbench ();

    reg clk, clk_test, reset;
    reg [35:0] ROMIN;
    reg [3:0] WR, RR;
    wire [44:0] out;
    wire [2:0] ALUMUX, ALUCTRL;
    wire [4:0] NXTADD;

    reg [55:0] expectedOut;
    reg [31:0] vectornum, errors;
    reg [91:0] testvectors[10000:0];

    // device under test
    controlSignals dut(clk, ROMIN, WR, RR,
                        out[44], out[43], out[42], out[41], 
                        out[40], out[39], out[38], out[37], out[36], out[35], out[34], out[33], out[32], out[31], out[30], out[29], 
                        out[28], out[27], out[26], out[25], out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], 
                        out[16], out[15], out[14], out[13], out[12], out[11], 
                        out[10], out[9], out[8], 
                        out[7], out[6], out[5], out[4], out[3], out[2], out[1], out[0],
                        ALUMUX, ALUCTRL, NXTADD);

    // generating the clock for the dut
    always 
        begin
            clk = 1; #10; clk = 0; #10;
        end

    // generating the clock for testing
    always 
        begin
            clk_test = 1; #20; clk_test = 0; #20;
        end

    // begin by loading vectors and resetting
    initial 
        begin
            $readmemb("controlSignals_testvectors.tv", testvectors);
            vectornum = 0; errors = 0;
            WR = 4'b1100;
            RR = 4'b0001;
            reset = 1; #25; reset = 0;
        end

    // apply test vectors on the pos edge of clock_test
    always @(posedge clk_test) 
        begin
            {ROMIN, expectedOut} = testvectors[vectornum];
        end

    // check the results in the neg edge of clock_test
    always @(negedge clk_test ) 
        if (~reset) begin
            if ({out, ALUMUX, ALUCTRL, NXTADD} !== expectedOut) begin
                $display("Error: Input = %b", ROMIN);
                $display("Output = %b (%b expected)", {out, ALUMUX, ALUCTRL, NXTADD}, expectedOut);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;

            if (testvectors[vectornum] === 90'bx) begin
                $display("%d tests completed with %d errors.", vectornum, errors);
                $finish;
            end
        end

endmodule //controlSignals_testbench