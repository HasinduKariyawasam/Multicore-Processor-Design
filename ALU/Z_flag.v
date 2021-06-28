module Z_flag(input clk, Z, 
            output reg Zout);

    always @(posedge clk) begin
        if (Z == 1 || Z == 0)
            Zout = Z;
        else
            Zout = Zout;
    end

endmodule