`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:01 04/02/2019
// Design Name:   program_counter
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/program_counter_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: program_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module program_counter_test;

	// Inputs
	reg clk;
	reg [31:0] d;
	reg en;

	// Outputs
	wire [31:0] q;

	// Instantiate the Unit Under Test (UUT)
	program_counter uut (
		.clk(clk), 
		.d(d), 
		.q(q), 
		.en(en)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		d = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        clk = ~clk;
        $display("PC = %h",q);
        #100;
        clk = ~clk;
        $display("PC = %h",q);
        #100;
        clk = ~clk;
        $display("PC = %h",q);
        #100;
        clk = ~clk;
        $display("PC = %h",q);

	end
      
endmodule

