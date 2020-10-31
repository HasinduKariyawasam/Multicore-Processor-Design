module testbench();

	reg [15:0] a, b;
	reg [2:0] ctrl;
	wire [15:0] out;
	wire z;
	
	ALU ALU1(a, b, ctrl, out, z);
	
	initial begin
		ctrl = 3'b0; a = 16'd22; b = 16'd10; #10;
		if(out !== 16'd32) $display("ADD failed");
		ctrl = 3'b001;		#10;
		if(out !== 16'd12) $display("SUB failed");
		ctrl = 3'b010;		#10;
		if(out !== 16'd220) $display("MUL failed");
		ctrl = 3'b011;		#10;
		if(out !== 16'd10) $display("M8Z failed");
		ctrl = 3'b100;		#10;
		if(out !== 16'd2) $display("M14Z failed");
		ctrl = 3'b101;		#10;
		if(out !== 16'd2) $display("RSH2 failed");
		ctrl = 3'b110;		#10;
		if(out !== 16'd0) $display("ZERO failed");
	end
endmodule