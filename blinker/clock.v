`timescale 1ns / 1ps

module clock(input clk, input rst, output tc); 
 
reg [25:0] clk_div;

always @(posedge clk)
    if(rst)
	     clk_div <= 0;
    else
	     if(tc)
		      clk_div <= 0;
		  else
	         clk_div <= clk_div + 1; 
 
assign tc = (clk_div == 49999999); 
//assign tc = (clk_div == 7); 

endmodule
