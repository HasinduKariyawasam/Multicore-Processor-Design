module INS_Ctrl (input [15:0] insaddr1, insaddr2, insaddr3, insaddr4,
                 input IMR1, IMR2, IMR3, IMR4,
                 output [15:0] insaddr,
                 output IMREAD);

    assign IMREAD = (IMR1 == 1 && IMR2 == 1 && IMR3 == 1 && IMR4 == 1) ? 1'b1 : 1'b0; // output instruction read control signal to Instruction Memory
    assign insaddr = insaddr1 & insaddr2 & insaddr3 & insaddr4;
    
endmodule