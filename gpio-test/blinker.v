`timescale 1ns / 1ps

module blinker(
    input clk,
	 input rst,
	 input sclk,
    input dir,	 
    output ld1,
    output ld2
);

reg [1:0] counter;

always @(posedge clk)
    if(rst)
	     counter <= 0;
	 else 
	     if(sclk)
		      if(dir) counter <= counter + 1;
				else counter <= counter - 1;

assign ld1 = counter[1];
assign ld2 = counter[0];

endmodule
