module enableDecoder(num_core, en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16); 

input [4:0] num_core; //The three Input lines of the decoder 

output reg en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12, en13, en14, en15, en16; 

always @(num_core) begin
   case(num_core)

     5'd1: begin
	 en1=1; en2=0; en3=0; en4=0; en5=0; en6=0; en7=0; en8=0;
	 en9=0; en10=0; en11=0; en12=0; en13=0; en14=0; en15=0; en16=0;
	
      end	

     5'd2: begin
	 en1=1; en2=1; en3=0; en4=0; en5=0; en6=0; en7=0; en8=0;
	 en9=0; en10=0; en11=0; en12=0; en13=0; en14=0; en15=0; en16=0;
	
      end	

     5'd4:  begin
	 en1=1; en2=1; en3=0; en4=0; en5=1; en6=1; en7=0; en8=0;
	 en9=0; en10=0; en11=0; en12=0; en13=0; en14=0; en15=0; en16=0;
	
      end	

     5'd8:  begin
	 en1=1; en2=1; en3=1; en4=1; en5=1; en6=1; en7=1; en8=1;
	 en9=0; en10=0; en11=0; en12=0; en13=0; en14=0; en15=0; en16=0;
	
      end	 

     5'd16:  begin
	 en1=1; en2=1; en3=1; en4=1; en5=1; en6=1; en7=1; en8=1;
	 en9=1; en10=1; en11=1; en12=1; en13=1; en14=1; en15=1; en16=1;
	
      end	

     default: begin
	  
	 en1=1; en2=1; en3=0; en4=0; en5=1; en6=1; en7=0; en8=0;
	 en9=0; en10=0; en11=0; en12=0; en13=0; en14=0; en15=0; en16=0;

      end 

endcase    
end

endmodule


