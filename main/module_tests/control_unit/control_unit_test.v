`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:20 04/02/2019
// Design Name:   control_unit
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/control_unit_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_unit_test;

	// Inputs
	reg clk;
	reg [5:0] Opcode;
	reg [5:0] Funct;

	// Outputs
	wire [3:0]ALUControl;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.clk(clk), 
		.Opcode(Opcode), 
		.Funct(Funct), 
		.ALUControl(ALUControl)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Opcode = 0;
		Funct = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

