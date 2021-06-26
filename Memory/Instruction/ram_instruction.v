module ram_instruction(DATAOUT,ADDBUS, RD, clk);
/*
	Control signals:
	
	clk - Clock signal
	RD - Read to memory
		
	Datapaths:
	
	DATAOUT - 16 bit data output from memory
	ADDBUS - 16 bit memory address
*/

   output reg [15:0] DATAOUT;
   input [15:0] ADDBUS;
   input RD, clk;
   reg [15:0] mem [65535:0];
	
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