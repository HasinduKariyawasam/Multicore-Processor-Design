//This module has 5 states
// state 0 : The idle state
// state 1 : Read from memory
// state 2 : Transmit to UART
// state 3 : Transmit
// state 4 : 
// state 5 : 
// state 6 : 
// state 7 : 
// state 8 : 



module uart_ctrl(input clk,
                input button, 
                input txDone,
                input [63:0]data_in,
                output reg [7:0]data_tx,
                output reg [15:0]data_addr,
                output reg memread,
                output reg txEn);

    parameter IDLE = 2'd0;
    parameter READ = 2'd1;
    parameter UART = 2'd2;
    parameter TX = 2'd3;

    reg unsigned [1:0] state = IDLE;
    reg [3:0] chunk = 4'd0;
    reg [63:0] datarow;

    always @ (posedge clk)

        case (state)

            IDLE: begin
                    if (button == 0)
                        begin
                            state <= READ;
                            data_addr <= 8'd8;
							memread <= 1'b1;
                        end
                    else
                        begin
                            state <= IDLE;				
                        end
				end

            READ: begin
                    state <= UART;
                    memread <= 1'b0;
                    datarow <= data_in;
					//txEn <= 1;
				end

            UART: begin
                    if (chunk == 4'd0)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[7:0];
                        end
                    else if (chunk == 4'd1)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[15:8];
                        end
                    else if (chunk == 4'd2)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[23:16];
                        end
                    else if (chunk == 4'd3)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[31:24];
                        end
                    else if (chunk == 4'd4)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[39:32];
                        end
                    else if (chunk == 4'd5)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[47:40];
                        end
                    else if (chunk == 4'd6)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[55:48];
                        end
                    else if (chunk == 4'd7)
                        begin
                            txEn <= 1;
                            state <= TX;
                            data_tx <= datarow[63:56];
                        end
                    else
                        begin
                            if (data_addr == 16'd11)
                                begin
                                    state <= IDLE;
                                    txEn <= 0;
                                    chunk <= 4'd0;
                                end
                            else
                                begin
                                    state <= READ;
                                    data_addr <= data_addr + 16'd1;
                                    chunk <= 4'd0;
                                    txEn <= 0;
								    memread <= 1;
                                end
                        end
                end

            TX: begin
                    if (txDone)
                        begin
                            chunk <= chunk + 4'd1;
                            state <= UART; 
                            txEn <= 0;
                        end
                    else
                        state <= TX;
				end

        endcase

endmodule