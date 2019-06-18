`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:59:07 04/07/2019
// Design Name:   mux_2_to_1
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/mux_2_to_1_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_2_to_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_2_to_1_test;

	// Inputs
	reg selector;
	reg [31:0] in0;
	reg [31:0] in1;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux_2_to_1 uut (
		.selector(selector), 
		.in0(in0), 
		.in1(in1), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		selector = 0;
		in0 = 0;
		in1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

