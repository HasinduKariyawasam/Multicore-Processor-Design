`timescale 1us/10ns

module testbench_RAM();

reg clk;            
reg [15:0] address;
reg read_en; 
reg write_en;
wire [15:0] DataOut;
reg [15:0] Datain;

ram_module dut(.ADDBUS(address),.DATAIN(Datain), .DATAOUT(DataOut),.clk(clk),.WR(write_en), .RD(read_en));

always // CLOCK
	begin
		clk = 1; #50; clk = 0; #50;
	end

initial begin

#50
address = 16'h0000; Datain = 16'h00FF; read_en = 0;  write_en = 1; #100;
address = 16'h0001; Datain = 16'hFF00; read_en = 0;  write_en = 1; #100;
address = 16'h0001; read_en = 1;  write_en = 0; #100;
address = 16'h0000; read_en = 1;  write_en = 0; #100;

address = 16'hFFFF; Datain = 16'h00FF; read_en = 0;  write_en = 1; #100;
address = 16'hFFFE; Datain = 16'hFF00; read_en = 0;  write_en = 1; #100;
address = 16'hFFFE; read_en = 1;  write_en = 0; #100;
address = 16'hFFFF; read_en = 1;  write_en = 0;

end
endmodule