module UART_BaudRate_generator(
    Clk                   ,
    Rst_n                 ,
    Tick                  ,
    BaudRate
    );

input           Clk                 ; // Clock input
input           Rst_n               ; // Reset input
input [15:0]    BaudRate            ; // Value to divide the generator by
output reg        Tick                ; // Each "BaudRate" pulses we create a tick pulse
reg [15:0]      baudRateReg         ; // Register used to count

initial Tick = 1'b1;

always @(posedge Clk or negedge Rst_n) begin
    if (!Rst_n) baudRateReg = 16'b1;
    else if (Tick) baudRateReg = 16'b1;
         else baudRateReg = baudRateReg + 1'b1;
		Tick = (baudRateReg == BaudRate);
		//if (baudRateReg == BaudRate) Tick = 1'b1;
		//else Tick = 1'b0;

end 

endmodule
