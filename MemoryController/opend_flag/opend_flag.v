module opend_flag(output reg state_ctrl_signal, input op1,op2,op3,op4,op5,op6,op7,op8,op9,op10,op11,op12,op13,op14,op15,op16);

wire and_out;

assign and_out = op1 & op2 & op3 & op4 & op5 & op6 & op7 & op8 & op9 & op10 & op11 & op12 & op13 & op14 & op15 & op16;

always @ (op1 or op2 or op3 or op4 or op5 or op6 or op7 or op8 or op9 or op10 or op11 or op12 or op13 or op14 or op15 or op16)
begin

state_ctrl_signal <= and_out;

end

endmodule