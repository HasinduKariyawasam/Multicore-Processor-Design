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

   initial begin
//	
//	 mem [16'd0]   = 16'd0;
//    mem [16'd1]   = 16'd52;
//    mem [16'd2]   = 16'd18;
//    mem [16'd3]   = 16'd96;
//    mem [16'd4]   = 16'd112;
//    mem [16'd5]   = 16'd183;
//    mem [16'd6]   = 16'd144;
//    mem [16'd7]   = 16'd182;
//    mem [16'd8]   = 16'd160;
//    mem [16'd9]   = 16'd176;
//    mem [16'd10]  = 16'd194;
//    mem [16'd11]  = 16'd192;
//    mem [16'd12]  = 16'd128;
//    mem [16'd13]  = 16'd184;
//    mem [16'd14]  = 16'd160;
//    mem [16'd15]  = 16'd60;
//    mem [16'd16]  = 16'd182;
//    mem [16'd17]  = 16'd231;
//    mem [16'd18]  = 16'd144;
//    mem [16'd19]  = 16'd80;
//    mem [16'd20]  = 16'd3;
//	 
		$readmemb("Y:/Documents/UOM Semester 5/Processor Phase 3/Instruction_memory/simulation/modelsim/INS_MEM.txt", mem);
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