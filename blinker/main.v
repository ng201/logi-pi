`timescale 1ns / 1ps

module main(input OSC_FPGA, input [1:0] PB, output [1:0] LED);

    // create slow clock
	 wire RST = ~PB[1];
    wire sec_clk;
	 
	 clock sclk(.clk(OSC_FPGA), .rst(RST), .tc(sec_clk));
    blinker bl(.clk(OSC_FPGA), .rst(RST), .sclk(sec_clk), .ld1(LED[0]), .ld2(LED[1]));

endmodule
