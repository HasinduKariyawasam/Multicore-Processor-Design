module Z_flag(input Z, 
            output reg Zout);

    always @(Z) begin
        if (Z === 1 || Z === 0)
            Zout = Z;
    end

    // always @(negedge Z) begin
    //     if (Z === 1 || Z === 0)
    //         Zout <= Z;
    // end

endmodule