`timescale 1ns/1ps
module demuxTest ();

    reg clk, reset;
    reg  [3:0] ADDR;
    wire [11:0] OUT; 
    reg [11:0] OUTExpected;
    reg [31:0] vectornum, errors;
    reg [15:0] testvectors[10000:0];

    // device under test
    demux4to12 dut(ADDR, OUT);

    // generating the clock
    always
        begin
            clk = 1; #10; clk = 0; #10;
        end
    
    // begin by loading vectors and resetting
    initial 
        begin
            $readmemb("demuxTestVectors.tv", testvectors);
            vectornum = 0; errors = 0;
            reset = 1; #25; reset = 0;
        end

    // apply test vectors on the pos edge
    always @(posedge clk) 
        begin
            {ADDR, OUTExpected} = testvectors[vectornum];
        end

    // check the results in the neg edge
    always @(negedge clk ) 
        if (~reset) begin
            if (OUT !== OUTExpected) begin
                $display("Error: Input = %b", ADDR);
                $display("Output = %b (%b expected)", OUT, OUTExpected);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;

            if (testvectors[vectornum] === 16'bx) begin
                $display("%d tests completed with %d errors.", vectornum, errors);
                $finish;
            end
        end

endmodule //demuxTest