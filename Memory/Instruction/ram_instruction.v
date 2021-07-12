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
   reg [15:0] mem [1023:0];

   initial begin
//	

	mem[16'd0] = 16'd0;
	mem[16'd1] = 16'd12292;
	mem[16'd2] = 16'd8342;
	mem[16'd3] = 16'd8390;
	mem[16'd4] = 16'd40960;
	mem[16'd5] = 16'd40960;
	mem[16'd6] = 16'd40960;
	mem[16'd7] = 16'd8348;
	mem[16'd8] = 16'd24576;
	mem[16'd9] = 16'd28672;
	mem[16'd10] = 16'd40960;
	mem[16'd11] = 16'd45056;
	mem[16'd12] = 16'd8354;
	mem[16'd13] = 16'd53248;
	mem[16'd14] = 16'd8342;
	mem[16'd15] = 16'd8390;
	mem[16'd16] = 16'd40960;
	mem[16'd17] = 16'd40960;
	mem[16'd18] = 16'd40960;
	mem[16'd19] = 16'd8348;
	mem[16'd20] = 16'd49152;
	mem[16'd21] = 16'd32768;
	mem[16'd22] = 16'd40960;
	mem[16'd23] = 16'd45056;
	mem[16'd24] = 16'd8386;
	mem[16'd25] = 16'd53248;
	mem[16'd26] = 16'd8346;
	mem[16'd27] = 16'd36864;
	mem[16'd28] = 16'd8347;
	mem[16'd29] = 16'd40960;
	mem[16'd30] = 16'd8380;
	mem[16'd31] = 16'd8392;
	mem[16'd32] = 16'd8342;
	mem[16'd33] = 16'd16384;
	mem[16'd34] = 16'd20480;
	mem[16'd35] = 16'd2;
	mem[16'd36] = 16'd24576;
	mem[16'd37] = 16'd28672;
	mem[16'd38] = 16'd8343;
	mem[16'd39] = 16'd36864;
	mem[16'd40] = 16'd32768;
	mem[16'd41] = 16'd8348;
	mem[16'd42] = 16'd49152;
	mem[16'd43] = 16'd40960;
	mem[16'd44] = 16'd57344;
	mem[16'd45] = 16'd8293;
	mem[16'd46] = 16'd53248;
	mem[16'd47] = 16'd8342;
	mem[16'd48] = 16'd4096;
	mem[16'd49] = 16'd8373;
	mem[16'd50] = 16'd61440;
	mem[16'd51] = 16'd4097;
	mem[16'd52] = 16'd8389;
	mem[16'd53] = 16'd8281;
	mem[16'd54] = 16'd16384;
	mem[16'd55] = 16'd20480;
	mem[16'd56] = 16'd2;
	mem[16'd57] = 16'd61696;


//	 
		// $readmemb("Z:/Desktop/FPGA Project/Multicore-Processor-Design/Compiler/INS_MEM.txt", mem);
	end
	
	// always @ (~clk)
	// 	begin
	// 		if (RD == 1)
	// 			begin
	// 				DATAOUT = mem[ADDBUS];
	// 			end
	// 		else 
	// 			begin
	// 				DATAOUT = 16'bz;
	// 			end
	// 	end
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