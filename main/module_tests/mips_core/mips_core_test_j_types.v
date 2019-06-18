`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:42 04/18/2019
// Design Name:   mips_core
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/mips_core_test_j_types.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define N_CYCLES 2000

module mips_core_test_j_types;

	// Inputs
	reg clk;
	reg rstb;

	// Instantiate the Unit Under Test (UUT)
	mips_core uut (
		.clk(clk), 
		.rstb(rstb)
	);

	integer i;

	initial begin
		// Initialize Inputs
		clk = 0;
		rstb = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Initialize Inputs
		clk = 0;
		rstb = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i <(`N_CYCLES * 2); i = i + 1) begin
			#10;
			clk = ~clk;
		end

		$display("DUMPING REGISTER FILE AFTER %d CYCLES", i/2);

		$display("\n");
		$display("Register\tHexValue\t\tDecValue\t\tExpectHex\t\tExpectDec\t\t\tCorrect?");
		$display("=====\t======\t\t======\t\t======\t\t======\t\t\t=====");
		$display("$r00\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r00, uut.REGISTER_FILE.r00, 32'h0, 0,		(uut.REGISTER_FILE.r00 == 0));
		$display("$r01\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r01, uut.REGISTER_FILE.r01, 32'h1, 1, 		(uut.REGISTER_FILE.r01 == 1));
		$display("$r02\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r02, uut.REGISTER_FILE.r02, 32'h2, 2, 		(uut.REGISTER_FILE.r02 == 2));
		$display("$r03\t%h\t\t%d\t%h\t\t%d\t\t%b",	   uut.REGISTER_FILE.r03, uut.REGISTER_FILE.r03, 32'h0040002c, 4194348, (uut.REGISTER_FILE.r03 == 4194348));
		$display("$r04\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r04, uut.REGISTER_FILE.r04, 32'h5, 5,	 	(uut.REGISTER_FILE.r04 == 5));
		$display("$r05\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r05, uut.REGISTER_FILE.r05, 32'hc, 12, 	(uut.REGISTER_FILE.r05 == 12));
		$display("$r06\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r06, uut.REGISTER_FILE.r06, 32'hc, 12, 	(uut.REGISTER_FILE.r06 == 12));
		$display("$r07\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r07, uut.REGISTER_FILE.r07, 32'hc, 12, 	(uut.REGISTER_FILE.r07 == 12));
		$display("$r08\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r08, uut.REGISTER_FILE.r08, 32'h8, 8, 		(uut.REGISTER_FILE.r08 == 8));
		$display("$r09\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r09, uut.REGISTER_FILE.r09, 32'h64, 100, 	(uut.REGISTER_FILE.r09 == 100));
		$display("$r10\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r10, uut.REGISTER_FILE.r10, 32'h64, 100,	(uut.REGISTER_FILE.r10 == 100));
		$display("$r11\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r11, uut.REGISTER_FILE.r11, 32'hb, 11, 	(uut.REGISTER_FILE.r11 == 11));
		$display("$r31\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r31, uut.REGISTER_FILE.r31, 32'h00400064, 4194404, 		(uut.REGISTER_FILE.r31 == 4194404));

	end
      
endmodule

