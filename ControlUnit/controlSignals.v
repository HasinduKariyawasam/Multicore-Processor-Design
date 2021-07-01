module controlSignals(input			 clk,
							 input 	[35:0] ROMIN,
							 input	[3:0]  WR, RR,
							 output			BR,
											MEMREAD, MEMWR,
											INSREAD,
											WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC,
											RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC,
											LDALUIR, LDALUIDX, LDALUIDY, LDALUR1, LDALUR5, LDALUAC,
											ALUOP, R2INC, PCINC,
											RSTR1, RSTR2, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7, RSTAR, RSTDR, RSTAC, OPEND,
							 output 	[2:0]	 ALUMUX, ALUCTRL,
							 output  [4:0]  NXTADD);
							 
	reg [34:0] outreg;
	
	demux4to12 WRREG(outreg[30:27], {WAR, WDR, WPC, WIR, WR1, WR2, WR3, WR4, WR5, WR6, WR7, WAC});
	demux4to12 REREG(outreg[26:23], {RAR, RDR, RPC, RIR, RR1, RR2, RR3, RR4, RR5, RR6, RR7, RAC});
	
	
	always @ (negedge clk)
		begin
			if (ROMIN[35])							//SP = 1
				begin
					outreg[34:31] <= ROMIN[34:31];
					outreg[30:27] <= WR;
					outreg[26:23] <= RR;
					outreg[22:0]  <= ROMIN[22:0];
				end
			else
				begin
					outreg <= ROMIN[34:0];
				end
		end
		
	assign BR = outreg[34];
	assign MEMREAD = outreg[33];
	assign MEMWR = outreg[32];
	assign INSREAD = outreg[31];
	assign LDALUIR = outreg[22];
	assign LDALUIDX = outreg[21];
	assign LDALUIDY = outreg[20];
	assign LDALUR1 = outreg[19];
	assign LDALUR5 = outreg[18];
	assign LDALUAC = outreg[17];
	assign ALUMUX = outreg[16:14];
	assign ALUCTRL = outreg[13:11];
	assign ALUOP = outreg[10];
	assign R2INC = outreg[9];
	assign PCINC = outreg[8];
	assign RSTR2 = (outreg[7] == 1'b1 | outreg[6] == 1'b1);
	assign {RSTR1, RSTR3, RSTR4, RSTR5, RSTR6, RSTR7, RSTAR, RSTDR, RSTAC} = outreg[6] ? 9'b111111111 : 9'b0;
	assign OPEND = outreg[5];
	assign NXTADD = outreg[4:0];

endmodule