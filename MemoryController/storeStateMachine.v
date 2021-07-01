module storeStateMachine (input clk, opendFlag, storeEnd,
                            output memWrite, swEnable);

    reg [1:0] state, nextState;

    parameter IDLE = 1'b0;
    parameter STORE = 1'b1;

    // state register
    always @(posedge clk ) begin
        state <= nextState;
    end

    // next state logic
    always @(*) begin
        case (state) 
            IDLE: if (opendFlag) nextState = STORE;
                  else           nextState = IDLE;
            STORE: if (storeEnd) nextState = IDLE;
                   else          nextState = STORE;
            default:             nextState = IDLE;
        endcase
    end

    // output logic
    assign memWrite = (state == STORE);
    assign swEnable = (state == STORE);

endmodule //storeStateMachine