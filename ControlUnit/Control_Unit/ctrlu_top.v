module ctrlu_top(input clk, input Br, input Z, input [7:0] IR, input [4:0] naddr, 
					  output [35:0] out);
	/*
		The module for the top part of the control unit
	*/
	
	wire [4:0] MAPLogic_connect;
	wire [4:0] logicReg_connect;
	wire [4:0] naregROM_connect;
	//wire [4:0] out;
	
	MAP MAP1(IR,MAPLogic_connect);
	
	Logic logic1(Z,MAPLogic_connect,naddr,Br,logicReg_connect);
	
	nareg nareg1(clk, logicReg_connect, naregROM_connect);
	
	ROM ROM1(naregROM_connect, out);
	
endmodule
