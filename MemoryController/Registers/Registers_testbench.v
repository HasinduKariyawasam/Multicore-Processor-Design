`timescale 1ns/1ps
module Registers_testbench();

	reg clk; 
    reg [3:0] STORE_ADD_1, STORE_ADD_2, STORE_ADD_3, STORE_ADD_4;
    reg [15:0] DATAIN_1, DATAIN_2, DATAIN_3, DATAIN_4;
    reg MEMWR_1, MEMWR_2, MEMWR_3, MEMWR_4;

    reg WRITE_MEM;
    reg [3:0] ROW_ADDR;

    wire [63:0] TO_DATA_MEM;
	
	Registers dut(clk, STORE_ADD_1, STORE_ADD_2, STORE_ADD_3, STORE_ADD_4,
    DATAIN_1, DATAIN_2, DATAIN_3, DATAIN_4,
    MEMWR_1, MEMWR_2, MEMWR_3, MEMWR_4, WRITE_MEM, ROW_ADDR, TO_DATA_MEM);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
        #50;
        STORE_ADD_1 = 4'd0; DATAIN_1 = 16'b1110000000000111; MEMWR_1 = 1'b1;
        STORE_ADD_2 = 4'd1; DATAIN_2 = 16'b0000000000000111; MEMWR_2 = 1'b1;
        STORE_ADD_3 = 4'd2; DATAIN_3 = 16'b1111111111111111; MEMWR_3 = 1'b1;
        STORE_ADD_4 = 4'd3; DATAIN_4 = 16'b1000000000000001; MEMWR_4 = 1'b1;

        #150;
        ROW_ADDR = 4'b1000; WRITE_MEM = 1'b1;
        
        #150;
        WRITE_MEM = 1'b0;

        STORE_ADD_1 = 4'd4; DATAIN_1 = 16'b1010101010101010; MEMWR_1 = 1'b1;
        STORE_ADD_2 = 4'd5; DATAIN_2 = 16'b1111111100000000; MEMWR_2 = 1'b1;
        STORE_ADD_3 = 4'd6; DATAIN_3 = 16'b1111000011110000; MEMWR_3 = 1'b1;
        STORE_ADD_4 = 4'd7; DATAIN_4 = 16'b1100110011001100; MEMWR_4 = 1'b1;

        #150;
        ROW_ADDR = 4'b1001; WRITE_MEM = 1'b1;
		#500;
        $finish;
	end

endmodule