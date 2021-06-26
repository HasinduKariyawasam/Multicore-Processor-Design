`timescale 1ns/1ps
module controlUnit_testbench ();

    reg clk, clk_test, reset_dut, reset, z;
    reg [15:0] IR;

    wire [42:0] out;
    wire [2:0] ALUMUX, ALUCTRL;

    reg [48:0] expectedOut;
    reg [31:0] vectornum, errors;
    reg [65:0] testvectors[10000:0];

    // device under test
    controlUnit dut(clk, z, IR,
                        out[42], out[41], out[40],
                        out[39], out[38], out[37], out[36], out[35], out[34], out[33], out[32], out[31], out[30], out[29], out[28],
                        out[27], out[26], out[25], out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], out[16],
                        out[15], out[14], out[13], out[12], out[11], out[10],
                        out[9], out[8], out[7], 
                        out[6], out[5], out[4], out[3], out[2], out[1], out[0],
                        ALUMUX, ALUCTRL);

    // generating the clock for the dut (device under test)
    always 
        if (~reset_dut) begin
            clk = 1; #10; clk = 0; #10;
        end

    // generating the clock for testing
    always 
        if (~reset) begin
            clk_test = 1; #14; clk_test = 0; #6;
        end

    // begin by loading vectors and resetting
    initial 
        begin
            $readmemb("controlSignals_testvectors.tv", testvectors);
            vectornum = 0; errors = 0;
            reset = 1; reset_dut = 1; 
            #38; reset = 0;
            #2; reset_dut = 0;
        end

    // apply test vectors on the pos edge of clock_test
    always @(posedge clk_test) 
        begin
            {IR, z, expectedOut} = testvectors[vectornum];
        end

    // check the results in the neg edge of clock_test
    always @(negedge clk_test ) 
        if (~reset) begin
            if ({out, ALUMUX, ALUCTRL} !== expectedOut) begin
                $display("Error: Input = %b", ROMIN);
                $display("Output = %b (%b expected)", {out, ALUMUX, ALUCTRL}, expectedOut);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;

            if (testvectors[vectornum] === 66'bx) begin
                $display("%d tests completed with %d errors.", vectornum, errors);
                $finish;
            end
        end

endmodule //controlUnit_testbench