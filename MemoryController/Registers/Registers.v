module Registers(
    input clk,
    
    input [3:0] STORE_ADD_1, STORE_ADD_2, STORE_ADD_3, STORE_ADD_4,
    input [15:0] DATAIN_1, DATAIN_2, DATAIN_3, DATAIN_4,
    input MEMWR_1, MEMWR_2, MEMWR_3, MEMWR_4,

    input WRITE_MEM,
    input [3:0] ROW_ADDR,
    output reg [63:0] TO_DATA_MEM );
    
    /*
      Control signals:
        
        STORE_ADD_i => Storing Address provided by the i_{th} core 
        DATAIN_i    => Data provided by the i_{th} core
        WRITE_MEM   => To output the 64 bit formation

        MEMWR_i     => Memory write enable signal from the i_{th} core

        Datapaths: 
            TO_DATA_MEM -> 64 bit data output to main memory
    */
    
    wire MEMWR;
    assign MEMWR = (MEMWR_1 == 1) && (MEMWR_2 == 1) && (MEMWR_3 == 1) && (MEMWR_4 == 1) ? 1'b1 : 1'b0;

    reg [15:0] R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16;
    wire [15:0] BOUT1, BOUT2, BOUT3, BOUT4, BOUT5, BOUT6, BOUT7, BOUT8, BOUT9, BOUT10, BOUT11, BOUT12, BOUT13, BOUT14, BOUT15, BOUT16;

    r  register1(clk, MEMWR, WRITE_MEM,   R1, BOUT1);
    r  register2(clk, MEMWR, WRITE_MEM,   R2, BOUT2);
    r  register3(clk, MEMWR, WRITE_MEM,   R3, BOUT3);
    r  register4(clk, MEMWR, WRITE_MEM,   R4, BOUT4);
    r  register5(clk, MEMWR, WRITE_MEM,   R5, BOUT5);
    r  register6(clk, MEMWR, WRITE_MEM,   R6, BOUT6);
    r  register7(clk, MEMWR, WRITE_MEM,   R7, BOUT7);
    r  register8(clk, MEMWR, WRITE_MEM,   R8, BOUT8);
    r  register9(clk, MEMWR, WRITE_MEM,   R9, BOUT9);
    r register10(clk, MEMWR, WRITE_MEM, R10, BOUT10);
    r register11(clk, MEMWR, WRITE_MEM, R11, BOUT11);
    r register12(clk, MEMWR, WRITE_MEM, R12, BOUT12);
    r register13(clk, MEMWR, WRITE_MEM, R13, BOUT13);
    r register14(clk, MEMWR, WRITE_MEM, R14, BOUT14);
    r register15(clk, MEMWR, WRITE_MEM, R15, BOUT15);
    r register16(clk, MEMWR, WRITE_MEM, R16, BOUT16);

    always @(*)
        begin
            if(WRITE_MEM == 1)
                case(ROW_ADDR)
                    4'b1000 : TO_DATA_MEM = {BOUT1,  BOUT2,  BOUT3	, BOUT4 };
                    4'b1001 : TO_DATA_MEM = {BOUT5,  BOUT6,  BOUT7	, BOUT8 };
                    4'b1010 : TO_DATA_MEM = {BOUT9,  BOUT10, BOUT11	, BOUT12 };
                    4'b1011 : TO_DATA_MEM = {BOUT13, BOUT14, BOUT15	, BOUT16 };
                endcase
        end
       
    always @(*) 
        begin
            case (STORE_ADD_1)
                4'd0  : R1 = DATAIN_1; 
                4'd1  : R2 = DATAIN_1; 
                4'd2  : R3 = DATAIN_1; 
                4'd3  : R4 = DATAIN_1; 
                4'd4  : R5 = DATAIN_1; 
                4'd5  : R6 = DATAIN_1; 
                4'd6  : R7 = DATAIN_1; 
                4'd7  : R8 = DATAIN_1; 
                4'd8  : R9 = DATAIN_1; 
                4'd9  : R10 = DATAIN_1; 
                4'd10 : R11 = DATAIN_1; 
                4'd11 : R12 = DATAIN_1; 
                4'd12 : R13 = DATAIN_1; 
                4'd13 : R14 = DATAIN_1; 
                4'd14 : R15 = DATAIN_1; 
                4'd15 : R16 = DATAIN_1; 
            endcase

            case (STORE_ADD_2)
               4'd0  : R1 = DATAIN_2; 
               4'd1  : R2 = DATAIN_2; 
               4'd2  : R3 = DATAIN_2; 
               4'd3  : R4 = DATAIN_2; 
               4'd4  : R5 = DATAIN_2; 
               4'd5  : R6 = DATAIN_2; 
               4'd6  : R7 = DATAIN_2; 
               4'd7  : R8 = DATAIN_2; 
               4'd8  : R9 = DATAIN_2; 
               4'd9  : R10 = DATAIN_2; 
               4'd10 : R11 = DATAIN_2; 
               4'd11 : R12 = DATAIN_2; 
               4'd12 : R13 = DATAIN_2; 
               4'd13 : R14 = DATAIN_2; 
               4'd14 : R15 = DATAIN_2; 
               4'd15 : R16 = DATAIN_2; 
            endcase

            case (STORE_ADD_3)
               4'd0  : R1 = DATAIN_3; 
               4'd1  : R2 = DATAIN_3; 
               4'd2  : R3 = DATAIN_3; 
               4'd3  : R4 = DATAIN_3; 
               4'd4  : R5 = DATAIN_3; 
               4'd5  : R6 = DATAIN_3; 
               4'd6  : R7 = DATAIN_3; 
               4'd7  : R8 = DATAIN_3; 
               4'd8  : R9 = DATAIN_3; 
               4'd9  : R10 = DATAIN_3; 
               4'd10 : R11 = DATAIN_3; 
               4'd11 : R12 = DATAIN_3; 
               4'd12 : R13 = DATAIN_3; 
               4'd13 : R14 = DATAIN_3; 
               4'd14 : R15 = DATAIN_3; 
               4'd15 : R16 = DATAIN_3; 
            endcase

            case (STORE_ADD_4)
               4'd0  : R1 = DATAIN_4; 
               4'd1  : R2 = DATAIN_4; 
               4'd2  : R3 = DATAIN_4; 
               4'd3  : R4 = DATAIN_4; 
               4'd4  : R5 = DATAIN_4; 
               4'd5  : R6 = DATAIN_4; 
               4'd6  : R7 = DATAIN_4; 
               4'd7  : R8 = DATAIN_4; 
               4'd8  : R9 = DATAIN_4; 
               4'd9  : R10 = DATAIN_4; 
               4'd10 : R11 = DATAIN_4; 
               4'd11 : R12 = DATAIN_4; 
               4'd12 : R13 = DATAIN_4; 
               4'd13 : R14 = DATAIN_4; 
               4'd14 : R15 = DATAIN_4; 
               4'd15 : R16 = DATAIN_4; 
           endcase
        end
    
//    always @(*) 
//        begin
//            case (STORE_ADD_2)
//                4'd0  : R1 = DATAIN_2; 
//                4'd1  : R2 = DATAIN_2; 
//                4'd2  : R3 = DATAIN_2; 
//                4'd3  : R4 = DATAIN_2; 
//                4'd4  : R5 = DATAIN_2; 
//                4'd5  : R6 = DATAIN_2; 
//                4'd6  : R7 = DATAIN_2; 
//                4'd7  : R8 = DATAIN_2; 
//                4'd8  : R9 = DATAIN_2; 
//                4'd9  : R10 = DATAIN_2; 
//                4'd10 : R11 = DATAIN_2; 
//                4'd11 : R12 = DATAIN_2; 
//                4'd12 : R13 = DATAIN_2; 
//                4'd13 : R14 = DATAIN_2; 
//                4'd14 : R15 = DATAIN_2; 
//                4'd15 : R16 = DATAIN_2; 
//            endcase
//        end
//    
//    always @(*) 
//        begin
//            case (STORE_ADD_3)
//                4'd0  : R1 = DATAIN_3; 
//                4'd1  : R2 = DATAIN_3; 
//                4'd2  : R3 = DATAIN_3; 
//                4'd3  : R4 = DATAIN_3; 
//                4'd4  : R5 = DATAIN_3; 
//                4'd5  : R6 = DATAIN_3; 
//                4'd6  : R7 = DATAIN_3; 
//                4'd7  : R8 = DATAIN_3; 
//                4'd8  : R9 = DATAIN_3; 
//                4'd9  : R10 = DATAIN_3; 
//                4'd10 : R11 = DATAIN_3; 
//                4'd11 : R12 = DATAIN_3; 
//                4'd12 : R13 = DATAIN_3; 
//                4'd13 : R14 = DATAIN_3; 
//                4'd14 : R15 = DATAIN_3; 
//                4'd15 : R16 = DATAIN_3; 
//            endcase
//        end
//
//    always @(*) 
//        begin
//            case (STORE_ADD_4)
//                4'd0  : R1 = DATAIN_4; 
//                4'd1  : R2 = DATAIN_4; 
//                4'd2  : R3 = DATAIN_4; 
//                4'd3  : R4 = DATAIN_4; 
//                4'd4  : R5 = DATAIN_4; 
//                4'd5  : R6 = DATAIN_4; 
//                4'd6  : R7 = DATAIN_4; 
//                4'd7  : R8 = DATAIN_4; 
//                4'd8  : R9 = DATAIN_4; 
//                4'd9  : R10 = DATAIN_4; 
//                4'd10 : R11 = DATAIN_4; 
//                4'd11 : R12 = DATAIN_4; 
//                4'd12 : R13 = DATAIN_4; 
//                4'd13 : R14 = DATAIN_4; 
//                4'd14 : R15 = DATAIN_4; 
//                4'd15 : R16 = DATAIN_4; 
//            endcase
//        end
endmodule