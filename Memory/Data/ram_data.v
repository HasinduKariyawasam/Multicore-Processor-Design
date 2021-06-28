module ram_data(DATAOUT_1,ADDBUS_1,DATAIN_1,WR_1, RD_1, DATAOUT_2,ADDBUS_2,DATAIN_2,WR_2, RD_2, clk);
/*
	Control signals: For duel core access following are duplicated and indexed by 1 and 2
	
	clk - Clock signal
	WR - Write to memory
	RD - Read from memory
		
	Datapaths: For duel core access following are duplicated and indexed by 1 and 2

	DATAOUT - 16 bit data output from memory
	ADDBUS - 16 bit memory address
	DATAIN - 16 bit data input to the memory
*/

   output reg [15:0] DATAOUT_1, DATAOUT_2;
   input [15:0] DATAIN_1, DATAIN_2;
   input [15:0] ADDBUS_1, ADDBUS_2;
   input WR_1,RD_1, WR_2, RD_2, clk;
   reg [15:0] mem [1023:0];

	initial begin
		// mem[16'd0] = 16'd10;
		// mem[16'd1] = 16'd12;
		$readmemb("D:/FPGA/Multicore Processor Design/Memory/Data/DATA_MEM.txt", mem);
	end

    always @(posedge clk) begin
			if (WR_1) begin
				mem[ADDBUS_1] <= DATAIN_1;
			end
			if (WR_2) begin
				mem[ADDBUS_2] <= DATAIN_2;
			end
			$writememb("D:/FPGA/Multicore Processor Design/Memory/Data/DATA_OUT.txt",mem,0,50);    	
   end
	
	
	always @ (RD_1)
		begin
			if (RD_1 == 1)
				begin
					DATAOUT_1 = mem[ADDBUS_1];
				end
			else 
				begin
					DATAOUT_1 = 16'bz;
				end
		end

	always @ (RD_2)
		begin
			if (RD_2 == 1)
				begin
					DATAOUT_2 = mem[ADDBUS_2];
				end
			else 
				begin
					DATAOUT_2 = 16'bz;
				end
		end
endmodule