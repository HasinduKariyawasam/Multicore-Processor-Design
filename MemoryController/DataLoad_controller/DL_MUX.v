module DL_MUX(input [1:0] id,
              input [15:0] c1, c2, c3, c4,
              output [15:0] data);
    /*
        Module to select the suitable data chunk for a core
        id - the virtual id of the core (IDX'/IDY')
        ci - i'th data chunk in the memory data row
        
        data - output data to the respective core
    */

    reg [15:0] out;

    always @(*) begin
        case (id)
            2'd0: out = c1; // Chunk C1
            2'd1: out = c2; // Chunk C2
            2'd2: out = c3; // Chunk C3
            2'd3: out = c4; // Chunk C4
        endcase
    end
	 
	assign data = out;

endmodule
