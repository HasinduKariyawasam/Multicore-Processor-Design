module INS_Ctrl (input [15:0] insaddr1, insaddr2, insaddr3, insaddr4, insaddr5, insaddr6, insaddr7, insaddr8, insaddr9, insaddr10, insaddr11, insaddr12, insaddr13, insaddr14, insaddr15, insaddr16,
                 input IMR1, IMR2, IMR3, IMR4, IMR5, IMR6, IMR7, IMR8, IMR9, IMR10, IMR11, IMR12, IMR13, IMR14, IMR15, IMR16,
                 output [15:0] insaddr,
                 output IMREAD);

    assign IMREAD = (IMR1 == 1 && IMR2 == 1 && IMR3 == 1 && IMR4 == 1 && IMR5 == 1 && IMR6 == 1 && IMR7 == 1 && IMR8 == 1 && IMR9 == 1 && IMR10 == 1 && IMR11 == 1 && IMR12 == 1 && IMR13 == 1 && IMR14 == 1 && IMR15 == 1 && IMR16 == 1) ? 1'b1 : 1'b0; // output instruction read control signal to Instruction Memory
    assign insaddr = insaddr1 & insaddr2 & insaddr3 & insaddr4 & insaddr5 & insaddr6 & insaddr7 & insaddr8 & insaddr9 & insaddr10 & insaddr11 & insaddr12 & insaddr13 & insaddr14 & insaddr15 & insaddr16;
    
endmodule