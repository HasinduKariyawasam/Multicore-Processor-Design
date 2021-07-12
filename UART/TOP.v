module TOP(
		button						,
    	Clk                     ,
    	Rst_n                   ,      
    	Tx                      ,

      data_addr,
      memread,
      data_in		
	);

/////////////////////////////////////////////////////////////////////////////////////////
input           Clk             ; // Clock
input           Rst_n           ; // Reset
input				button				; //Button
output          Tx              ; // RS232 TX line.
output			 [15:0]data_addr;
output			 memread;
input 			[63:0]data_in;
/////////////////////////////////////////////////////////////////////////////////////////
wire [7:0]    	TxData     	; // Data to transmit.
wire          	TxDone          ; // Trnasmission completed. Data sent.
wire            tick		; // Baud rate clock
wire         	TxEn            ;
wire [6:0]      NBits    	;
wire [15:0]    	BaudRate        ; //328; 162 etc... (Read comment in baud rate generator file)
/////////////////////////////////////////////////////////////////////////////////////////
assign 		RxEn = 1'b1	;

assign 		BaudRate = 16'd325; 	//baud rate set to 9600 for the HC-06 bluetooth module. Why 325? (Read comment in baud rate generator file)
assign 		NBits = 4'b1000	;	//We send/receive 8 bits
/////////////////////////////////////////////////////////////////////////////////////////


//Make connections between Rx module and TOP inputs and outputs and the other modules
//UART_rs232_rx I_RS232RX(
//    	.Clk(Clk)             	,
//   	.Rst_n(Rst_n)         	,
//    	.RxEn(RxEn)           	,
//    	.RxData(RxData)       	,
//    	.RxDone(RxDone)       	,
//    	.Rx(Rx)               	,
//    	.Tick(tick)           	,
//    	.NBits(NBits)
//    );

//Make connections between Tx module and TOP inputs and outputs and the other modules
UART_rs232_tx I_RS232TX(
   	.Clk(Clk)            	,
    	.Rst_n(Rst_n)         	,
    	.TxEn(TxEn)           	,
    	.TxData(TxData)      	,
   	.TxDone(TxDone)      	,
   	.Tx(Tx)               	,
   	.Tick(tick)           	,
   	.NBits(NBits)
    );

//Make connections between tick generator module and TOP inputs and outputs and the other modules
UART_BaudRate_generator I_BAUDGEN(
    	.Clk(Clk)               ,
    	.Rst_n(Rst_n)           ,
    	.Tick(tick)             ,
    	.BaudRate(BaudRate)
    );

//counter I_counter(
//
//		.clk(Clk) ,
//		.reset(Rst_n),
//		.button(button),
//		.LEDS(TxData),
//		.TxEn(TxEn)
//	);
//		
uart_ctrl uart_ctrl( 
		.clk(Clk),
      .button(button), 
      .txDone(TxDone),
      .data_in(data_in),
      .data_tx(TxData),
      .data_addr(data_addr),
      .memread(memread),
      .txEn(TxEn)
	);

endmodule