`timescale 1ns / 1ps

module director(
    input clk,
	 input rst,
	 input sclk, 
    input btn,
	 
    output dir 
);

reg bstate;   // button's state
reg current;  // the current direction

always @(posedge clk)
begin
    if(rst)
	 begin
	     bstate <= 0;
	     current <= 1;
    end		  
	 else if(btn && !bstate) /* pressed */
	 begin
	     bstate <= 1;
	     current <= ~current;
    end
	 else if(!btn && bstate) /* released */
	 begin
	     bstate <= 0;
	 end
end  

assign dir = current;

endmodule
