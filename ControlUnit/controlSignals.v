module controlSignals(input			 clk,
							 input 	[34:0] ROMIN,
							 input	[3:0]  WR, RR,
							 output			BR,
											MEMREAD, MEMWR,
											INSREAD,
											WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
											RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
											LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
											ALUOP, R2INC, PCINC,
											RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7,
							 output 	[2:0]	 ALUMUX, ALUCTRL,
							 output  [4:0]  NXTADD);
							 
	reg [33:0] outreg;
	
	demux4to12 WRREG(outreg[29:26], {WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC});
	demux4to12 REREG(outreg[25:22], {RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC});

	//initial outreg = 34'b0001010000000000000000000000000001;	
	
	always @ (negedge clk)
		begin
			if (ROMIN[34])							//SP = 1
				begin
					outreg[33:30] <= ROMIN[33:30];
					outreg[29:26] <= WR;
					outreg[25:22] <= RR;
					outreg[21:0]  <= ROMIN[21:0];
				end
			else
				begin
					outreg <= ROMIN[33:0];
				end
		end
		
	assign BR = outreg[33];
	assign MEMREAD = outreg[32];
	assign MEMWR = outreg[31];
	assign INSREAD = outreg[30];
	assign LDALUIR = outreg[21];
	assign LDALUIDX = outreg[20];
	assign LDALUIDY = outreg[19];
	assign LDALUR1 = outreg[18];
	assign LDALUR5 = outreg[17];
	assign LDALUAC = outreg[16];
	assign ALUMUX = outreg[15:13];
	assign ALUCTRL = outreg[12:10];
	assign ALUOP = outreg[9];
	assign R2INC = outreg[8];
	assign PCINC = outreg[7];
	assign RSTR2 = (outreg[6] == 1'b1 | outreg[5] == 1'b1);
	assign {RSTR1, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7} = outreg[5] ? 6'b111111 : 6'b0;
	assign NXTADD = outreg[4:0];

endmodule