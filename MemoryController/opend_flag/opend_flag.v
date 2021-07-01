module opend_flag(output reg state_ctrl_signal, input op1,op2,op3,op4);

wire and_out;

assign and_out = op1 & op2 & op3 & op4;

always @ (op1 or op2 or op3 or op4)
begin

state_ctrl_signal <= and_out;
end

endmodule