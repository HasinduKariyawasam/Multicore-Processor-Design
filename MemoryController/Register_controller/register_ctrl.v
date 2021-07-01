//This module has 5 states
// state 0 : The idle state
// state 1 : Order the register bank to write to 1000 row
// state 2 : Order the register bank to write to 1001 row
// state 3 : Order the register bank to write to 1010 row
// state 4 : Order the register bank to write to 1011 row

module register_ctrl(

        input clk,

        input state_ctrl_store,
		  
		output reg [3:0] rowaddr,
		  
		output reg [15:0] sw2_out,
		  
		output reg writemem,

        output reg state_ctrl_done);

		  
    reg unsigned [2:0] state;


    always @ (negedge clk)

        case (state)

            3'b000: begin
				if (state_ctrl_store == 1)
				begin
				state <= 3'b001;
				writemem <= 1'b1;
				rowaddr <= 4'b1000;
				sw2_out <= 16'b1000;
				end
				else
				begin
				state <= 3'b000;
				writemem <= 1'b0;
				rowaddr <= 4'b1000;
				sw2_out <= 16'b1000;
				state_ctrl_done <= 1'b0;				
				end
				
				end
            3'b001: begin
				state <= 3'b010;
				rowaddr <= 4'b1001;
				sw2_out <= 16'b1001;
				writemem <= 1'b1;
				end

            3'b010: begin
				state <= 3'b011;
				rowaddr <= 4'b1010;
				sw2_out <= 16'b1010;
				writemem <= 1'b1;
				end

            3'b011: begin
				state <= 3'b100;
				rowaddr <= 4'b1011;
				sw2_out <= 16'b1011;
				writemem <= 1'b1;
				end
				
				3'b100: begin
				state <= 3'b000;
				rowaddr <= 4'b1000;
				sw2_out <= 16'b1000;
				writemem <= 1'b0;
				state_ctrl_done <= 1'b1;
				end
				
				default: begin
				state <= 3'b000;
				end

        endcase

endmodule