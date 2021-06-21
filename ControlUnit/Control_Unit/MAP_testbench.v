`timescale 1us/10ns
module MAP_testbench();

	reg [7:0] ir;
	wire [4:0] out;
	
	MAP MAP1(ir,out);
	
	initial begin
		ir = 8'd0; #200; // RSTALL
		ir = 8'd16; #200; // CONST
		ir = 8'd32; #200; // MOV
		ir = 8'd32; #200; // MOV (Repeated)
		ir = 8'd48; #200; // SIZE
		ir = 8'd64; #200; // SUB
		ir = 8'd80; #200; // JMPNZ
		ir = 8'd96; #200; // MOV02
		ir = 8'd112; #200; // ADDX
		ir = 8'd128; #200; // ADDY
		ir = 8'd128; #200; // ADDY (Repeated)
		ir = 8'd144; #200; // MUL
		ir = 8'd160; #200; // ADD
		ir = 8'd176; #200; // LOAD
		ir = 8'd192; #200; // MOV13
		ir = 8'd208; #200; // INCI
		ir = 8'd224; #200; // STORE
		ir = 8'd240; #200; // RSTI
		ir = 8'd2; #200; // Undefined states
		ir = 8'd241; #200; // Undefined states			
	end

endmodule
