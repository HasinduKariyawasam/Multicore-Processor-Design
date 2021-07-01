module ram_data(DATAOUT,ADDBUS,DATAIN,WR, RD, clk);
/*
	Control signals:
	
	clk - Clock signal
	WR - Write to memory
	RD - Read from memory
		
	Datapaths:
	
	DATAOUT - 64 bit data output from memory
	ADDBUS - 16 bit memory address
	DATAIN - 64 bit data input to the memory
*/

   output reg [63:0] DATAOUT;
   input [63:0] DATAIN;
   input [15:0] ADDBUS;
   input WR,RD, clk;
   reg [63:0] mem [511:0];

	initial begin
		mem[16'd0] = (64'd1 << 48) + (64'd5 << 32) + (64'd9 << 16) + 64'd13;
		mem[16'd1] = (64'd1 << 48) + (64'd2 << 32) + (64'd3 << 16) + 64'd4;
		mem[16'd2] = (64'd2 << 48) + (64'd6 << 32) + (64'd10 << 16) + 64'd14;
		mem[16'd3] = (64'd5 << 48) + (64'd6 << 32) + (64'd7 << 16) + 64'd8;
		//$readmemb("D:/FPGA/Multicore Processor Design/Memory/Data/DATA_MEM.txt", mem);
	end

    always @(posedge clk) begin
			if (WR) begin
				mem[ADDBUS] <= DATAIN;
			end
			$writememb("D:/FPGA/Multicore Processor Design/Memory/Data/DATA_OUT.txt",mem,0,50);    	
   end
	
	
	always @ (RD)
		begin
			if (RD == 1)
				begin
					DATAOUT = mem[ADDBUS];
				end
			else 
				begin
					DATAOUT = 16'bz;
				end
		end
endmodule