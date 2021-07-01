module r(clk, MEM_WRITE, MEM_READ, DATA, BOUT);
	/*  
        Control signals:
            clk        - Clock signal
            MEM_WRITE  - Control signal to write data to register
            MEM_READ   - Control signal to get data out from register
		
		Datapaths:

            BOUT - Get data out from register through this line
	*/

	input clk, MEM_WRITE, MEM_READ;     // Clock and Control signals

	input [15:0] DATA;     // Input data

	output [15:0] BOUT;
	
	reg unsigned [15:0] register;  //store data;
	reg unsigned [15:0] BOUT;	// output to 64 bit line formation
	
	always @ (posedge clk)
		begin
            if(MEM_WRITE)
                register <= DATA; //only one value is present at a time
		end
		
	always @ (MEM_READ)
		begin
			if (MEM_READ == 1)
				BOUT = register;
			else
				BOUT = 16'bz;
		end
endmodule
