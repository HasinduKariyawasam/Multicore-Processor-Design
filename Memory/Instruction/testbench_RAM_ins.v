`timescale 1us/10ns

module testbench_RAM_ins();

reg clk;            
reg [15:0] address;
reg read_en; 
wire [15:0] DataOut;


ram_instruction dut(.ADDBUS(address), .DATAOUT(DataOut),.clk(clk), .RD(read_en));

always // CLOCK
	begin
		clk = 1; #50; clk = 0; #50;
	end

initial begin

#50

address = 16'd2; read_en = 1;  #100;
address = 16'd4; read_en = 1;  #100;
address = 16'd6; read_en = 1;  #100;
address = 16'd8; read_en = 1;  #100;
address = 16'd10; read_en = 1;  #100;
address = 16'd10; read_en = 1;  #100;


end
endmodule