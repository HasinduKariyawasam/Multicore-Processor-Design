module switch (input ctrl,
                input[15:0] in1, in2,
                output [15:0] out );

    assign out = ctrl ? in1 : in2;

endmodule //switch