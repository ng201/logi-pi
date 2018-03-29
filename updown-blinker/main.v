`timescale 1ns / 1ps

module main(input OSC_FPGA, input [1:0] PB, output [1:0] LED);

    // prepare buttons;  RST and BTN are high actives
    wire RST, BTN;
	 assign RST = ~PB[1];
    debouncer deb(.clk(OSC_FPGA), .rst(PB[1]), .btn_in(PB[0]), .btn_out(BTN));

    // create slow clock
    wire sec_clk;
	 sectick sec(.clk(OSC_FPGA), .rst(RST), .tc(sec_clk));

    // logic
	 wire d;
    director dr(.clk(OSC_FPGA), .rst(RST), .sclk(sec_clk), .btn(BTN), .dir(d));
    blinker  bl(.clk(OSC_FPGA), .rst(RST), .dir(d), .sclk(sec_clk), .ld1(LED[0]), .ld2(LED[1]));

endmodule
