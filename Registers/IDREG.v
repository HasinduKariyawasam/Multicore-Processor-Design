module IDREG #(parameter [15:0] ID = 16'b0) (input clk, 
											input LDALU, 
											output reg [15:0] TOALU);

	always @ (LDALU)
		begin
			if (LDALU)
				TOALU <= ID;
		end
		
endmodule
	