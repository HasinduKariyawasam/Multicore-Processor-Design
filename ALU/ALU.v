module ALU(input [15:0] ALU_IN1, ALU_IN2,
			  input [2:0] CTRL,
			  output [15:0] ALU_OUT,
			  output z);
			  
	reg [15:0] result;
	
	always @ (*)
		case (CTRL)
			3'b000: result = ALU_IN1 + ALU_IN2;		//ADD
			3'b001: result = ALU_IN1 - ALU_IN2;		//SUB
			3'b010: result = ALU_IN1 * ALU_IN2;		//MUL
			3'b011: result = {8'b0, ALU_IN2[7:0]};	//M8Z
			3'b100: result = {14'b0, ALU_IN2[1:0]};	//M14Z
			3'b101: result = (ALU_IN2 >> 2);			//RSH2
			3'b110: result = 16'b0;						//ZERO
		endcase
		
	assign ALU_OUT = result;
	assign z = (result == 16'b0);
	
endmodule