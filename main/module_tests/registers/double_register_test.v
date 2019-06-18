`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:07:56 04/07/2019
// Design Name:   double_register
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/double_register_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: double_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module double_register_test;

	// Inputs
	reg clk;
	reg rst;
	reg ena;
	reg [31:0] dA;
	reg [31:0] dB;

	// Outputs
	wire [31:0] qA;
	wire [31:0] qB;

	// Instantiate the Unit Under Test (UUT)
	double_register uut (
		.clk(clk), 
		.rst(rst), 
		.ena(ena), 
		.dA(dA), 
		.dB(dB), 
		.qA(qA), 
		.qB(qB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		ena = 0;
		dA = 0;
		dB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

