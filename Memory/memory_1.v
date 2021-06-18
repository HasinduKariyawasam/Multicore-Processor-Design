module phase_2_harindu (Add_bus,Data_bus_in, Data_bus_out,clk,WR_signal, RD_signal);


   input [15:0] Add_bus; 
   input clk; 
   input [15:0] Data_bus_in; 
	output [15:0] Data_bus_out;
   input WR_signal,RD_signal; 

		ram_single RAM(Data_bus_out,Add_bus,Data_bus_in,WR_signal, RD_signal, clk);
	
endmodule


module ram_single(q, a, d, wr,re, clk);
   output reg [15:0] q;
   input [15:0] d;
   input [15:0] a;
   input wr,re, clk;
   reg [15:0] mem [65535:0];
    always @(negedge clk) begin
			if (wr)
            mem[a] <= d;
			if (re)
				q <= mem[a];
   end
endmodule