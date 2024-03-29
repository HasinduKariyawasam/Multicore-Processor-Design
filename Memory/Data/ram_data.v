module ram_data(DATAOUT,ADDBUS,DATAIN,WR, RD, clk);
/*
	Control signals:
	
	clk - Clock signal
	WR - Write to memory
	RD - Read to memory
		
	Datapaths:
	
	DATAOUT - 16 bit data output from memory
	ADDBUS - 16 bit memory address
	DATAIN - 16 bit data input to the memory
*/

   output reg [15:0] DATAOUT;
   input [15:0] DATAIN;
   input [15:0] ADDBUS;
   input WR,RD, clk;
   reg [15:0] mem [65535:0];
    always @(posedge clk) begin
			if (WR)
            mem[ADDBUS] <= DATAIN;
   end
	
	
	always @ (~clk)
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