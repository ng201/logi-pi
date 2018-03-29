`timescale 1ns / 1ps

module main_test;

  // Inputs
	reg OSC_FPGA;
	reg [1:0] PB;

	// Outputs
	wire [1:0] LED;

	// Instantiate the Unit Under Test (UUT)
	main uut(
		.OSC_FPGA(OSC_FPGA), 
		.PB(PB), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		OSC_FPGA = 0;
		PB = 0;
		
		#10  PB = 2;
		#50  PB = 0;
		#100 PB = 1;
		#110 PB = 0;
      #150 PB = 1;
		#160 PB = 0;
	end
	
	always #10 OSC_FPGA = ~OSC_FPGA;
       
endmodule
