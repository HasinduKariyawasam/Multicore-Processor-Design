`timescale 1ns/1ps
module DLCtrl_testbench();
	
	reg [63:0] data;
	reg MR1, MR2, MR3, MR4;
    reg [15:0] MADDR1, MADDR2, MADDR3, MADDR4;
    wire MEMREAD;
	wire [15:0] MEMADDR;
	wire [15:0] DOUT1, DOUT2, DOUT3, DOUT4;
	
	DL_Controller DL_Controller1(data,
                    MR1, MR2, MR3, MR4,
                    MADDR1, MADDR2, MADDR3, MADDR4,
                    MEMREAD,
                    MEMADDR,
                    DOUT1, DOUT2, DOUT3, DOUT4);
	
	initial begin
		data= (64'd1 << 48) + (64'd5 << 32) + (64'd9 << 16) + 64'd13; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd0 << 2) + 16'd0; MADDR2 = (16'd0 << 2) + 16'd0; MADDR3 = (16'd0 << 2) + 16'd1; MADDR4 = (16'd0 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd1) $display("Core 1 M1-element1 data fetched");
		if(DOUT2 === 16'd1) $display("Core 2 M1-element1 data fetched");
		if(DOUT3 === 16'd5) $display("Core 3 M1-element1 data fetched");
		if(DOUT4 === 16'd5) $display("Core 4 M1-element1 data fetched");
		
		data= (64'd1 << 48) + (64'd2 << 32) + (64'd3 << 16) + 64'd4; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd1 << 2) + 16'd0; MADDR2 = (16'd1 << 2) + 16'd1; MADDR3 = (16'd1 << 2) + 16'd0; MADDR4 = (16'd1 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd1) $display("Core 1 M2-element1 data fetched");
		if(DOUT2 === 16'd2) $display("Core 2 M2-element1 data fetched");
		if(DOUT3 === 16'd1) $display("Core 3 M2-element1 data fetched");
		if(DOUT4 === 16'd2) $display("Core 4 M2-element1 data fetched");	
		
		data= (64'd2 << 48) + (64'd6 << 32) + (64'd10 << 16) + 64'd14; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd2 << 2) + 16'd0; MADDR2 = (16'd2 << 2) + 16'd0; MADDR3 = (16'd2 << 2) + 16'd1; MADDR4 = (16'd2 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd2) $display("Core 1 M1-element2 data fetched");
		if(DOUT2 === 16'd2) $display("Core 2 M1-element2 data fetched");
		if(DOUT3 === 16'd6) $display("Core 3 M1-element2 data fetched");
		if(DOUT4 === 16'd6) $display("Core 4 M1-element2 data fetched");
	
		data= (64'd5 << 48) + (64'd6 << 32) + (64'd7 << 16) + 64'd8; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd3 << 2) + 16'd0; MADDR2 = (16'd3 << 2) + 16'd1; MADDR3 = (16'd3 << 2) + 16'd0; MADDR4 = (16'd3 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd5) $display("Core 1 M2-element2 data fetched");
		if(DOUT2 === 16'd6) $display("Core 2 M2-element2 data fetched");
		if(DOUT3 === 16'd5) $display("Core 3 M2-element2 data fetched");
		if(DOUT4 === 16'd6) $display("Core 4 M2-element2 data fetched");

		data= (64'd3 << 48) + (64'd7 << 32) + (64'd11 << 16) + 64'd15; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd4 << 2) + 16'd0; MADDR2 = (16'd4 << 2) + 16'd0; MADDR3 = (16'd4 << 2) + 16'd1; MADDR4 = (16'd4 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd3) $display("Core 1 M1-element3 data fetched");
		if(DOUT2 === 16'd3) $display("Core 2 M1-element3 data fetched");
		if(DOUT3 === 16'd7) $display("Core 3 M1-element3 data fetched");
		if(DOUT4 === 16'd7) $display("Core 4 M1-element3 data fetched");
	
		data= (64'd9 << 48) + (64'd10 << 32) + (64'd11 << 16) + 64'd12; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd5 << 2) + 16'd0; MADDR2 = (16'd5 << 2) + 16'd1; MADDR3 = (16'd5 << 2) + 16'd0; MADDR4 = (16'd5 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd9) $display("Core 1 M2-element3 data fetched");
		if(DOUT2 === 16'd10) $display("Core 2 M2-element3 data fetched");
		if(DOUT3 === 16'd9) $display("Core 3 M2-element3 data fetched");
		if(DOUT4 === 16'd10) $display("Core 4 M2-element3 data fetched");

		data= (64'd4 << 48) + (64'd8 << 32) + (64'd12 << 16) + 64'd16; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd6 << 2) + 16'd0; MADDR2 = (16'd6 << 2) + 16'd0; MADDR3 = (16'd6 << 2) + 16'd1; MADDR4 = (16'd6 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd4) $display("Core 1 M1-element4 data fetched");
		if(DOUT2 === 16'd4) $display("Core 2 M1-element4 data fetched");
		if(DOUT3 === 16'd8) $display("Core 3 M1-element4 data fetched");
		if(DOUT4 === 16'd8) $display("Core 4 M1-element4 data fetched");

		data= (64'd13 << 48) + (64'd14 << 32) + (64'd15 << 16) + 64'd16; 
		MR1=1; MR2=1; MR3=1; MR4=1; 
		MADDR1 = (16'd7 << 2) + 16'd0; MADDR2 = (16'd7 << 2) + 16'd1; MADDR3 = (16'd7 << 2) + 16'd0; MADDR4 = (16'd7 << 2) + 16'd1;#50;
		if(DOUT1 === 16'd13) $display("Core 1 M2-element4 data fetched");
		if(DOUT2 === 16'd14) $display("Core 2 M2-element4 data fetched");
		if(DOUT3 === 16'd13) $display("Core 3 M2-element4 data fetched");
		if(DOUT4 === 16'd14) $display("Core 4 M2-element4 data fetched");
		
	end

endmodule