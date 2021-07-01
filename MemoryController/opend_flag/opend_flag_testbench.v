`timescale 1us/10ns
module opend_flag_testbench();

	wire state_ctrl_signal;
	reg op1,op2,op3,op4;

	
	opend_flag dut(state_ctrl_signal,op1,op2,op3,op4);
	
	
	initial begin
	
	   #50;
		op1=1'b1;op2=1'b0;op3=1'b0;op4=1'b0;#100;op1=1'b0;op2=1'b0;op3=1'b0;op4=1'b0;
		#300;
		op1=1'b1;op2=1'b1;op3=1'b1;op4=1'b0;#100;op1=1'b0;op2=1'b0;op3=1'b0;op4=1'b0;
		#300;
		op1=1'b1;op2=1'b1;op3=1'b1;op4=1'b1;#100;op1=1'b0;op2=1'b0;op3=1'b0;op4=1'b0;
		#300;		
		$finish;
	end

endmodule