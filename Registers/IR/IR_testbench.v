`timescale 1ns/10ps
module IR_testbench();

	reg clk; 
	reg WR, LDBUS, LDALU;
	reg [15:0] IM;
	reg [15:0] BIN;
	
	wire [15:0] BOUT;
   wire [15:0] ALU;
   wire [15:0] CU;
	
	IR IR(clk,IM,WR,LDBUS,LDALU,BOUT,ALU,CU);
	
	always // CLOCK
		begin
			clk = 1; #50; clk = 0; #50;
		end
	
	initial begin
		#50;
		WR=1'b1; LDBUS=1'b0; LDALU=1'b0; IM = 16'd64; #100; // write 64
		WR=1'b0; LDBUS=1'b1; LDALU=1'b0; IM = 16'dx;  #100; // read from IR to BUS

	  if (BOUT !== 16'd64) begin
			$display("Error:");
			$display("Output = %b (%b expected)", BOUT, 16'd64);
	  end
	  
	  WR=1'b1; LDBUS=1'b0; LDALU=1'b0; IM = 16'd255; #100; // write 128
	  WR=1'b0; LDBUS=1'b1; LDALU=1'b0; IM = 16'dx;  #100; // read from IR to BUS
		
	  if (BOUT !== 16'd255) begin
			$display("Error:");
			$display("Output = %b (%b expected)", BOUT, 16'd255);
	  end	
	 
	  if (CU !== 16'd255) begin
			$display("Error:");
			$display("Output = %b (%b expected)", CU, 16'd255);
	  end	 
	  $finish;

	end

endmodule