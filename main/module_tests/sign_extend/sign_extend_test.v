`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:22 04/12/2019
// Design Name:   sign_extend
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/sign_extend_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "../../defines/instruction_defines.v"

module sign_extend_test;

	// Inputs
	reg [`INSTR_IMM_RANGE] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	sign_extend uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 1;
		#100;
		in = -1;
		#100;
	end
      

    always @(in) begin
    	#10;
    	$display("In = %b, Out = %b",in, out);
    end
endmodule

