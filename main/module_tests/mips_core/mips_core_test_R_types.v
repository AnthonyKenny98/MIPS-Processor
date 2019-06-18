`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:00:24 04/08/2019
// Design Name:   mips_core
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/mips_core_test_R_types.v
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
`define N_CYCLES 1000

module mips_core_test_R_types;

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
		for (i = 0; i <(`N_CYCLES * 2); i = i + 1) begin
			#10;
			clk = ~clk;
		end

		$display("DUMPING REGISTER FILE AFTER %d CYCLES", i/2);

		$display("\n");
		$display("Register\tHexValue\t\tDecValue\t\tExpectHex\t\tExpectDec\t\t\tCorrect?");
		$display("=====\t======\t\t======\t\t======\t\t======\t\t\t=====");
		$display("$r00\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r00, uut.REGISTER_FILE.r00, 32'h0, 0,		(uut.REGISTER_FILE.r00 == 0));
		$display("$r01\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r01, uut.REGISTER_FILE.r01, -32'h1, -1, 	(uut.REGISTER_FILE.r01 == -1));
		$display("$r02\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r02, uut.REGISTER_FILE.r02, 32'h1, 1, 		(uut.REGISTER_FILE.r02 == 1));
		$display("$r03\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r03, uut.REGISTER_FILE.r03, -32'h1, -1, 	(uut.REGISTER_FILE.r03 == -1));
		$display("$r04\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r04, uut.REGISTER_FILE.r04, 32'h1, 1, 		(uut.REGISTER_FILE.r04 == 1));
		$display("$r05\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r05, uut.REGISTER_FILE.r05, 32'h2, 2, 		(uut.REGISTER_FILE.r05 == 2));
		$display("$r06\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r06, uut.REGISTER_FILE.r06, 32'h4, 4, 		(uut.REGISTER_FILE.r06 == 4));
		$display("$r07\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r07, uut.REGISTER_FILE.r07, 32'h5, 5, 		(uut.REGISTER_FILE.r07 == 5));
		$display("$r08\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r08, uut.REGISTER_FILE.r08, 32'h1, 1, 		(uut.REGISTER_FILE.r08 == 1));
		$display("$r09\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r09, uut.REGISTER_FILE.r09, 32'h7, 7, 		(uut.REGISTER_FILE.r09 == 7));
		$display("$r10\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r10, uut.REGISTER_FILE.r10, 32'h2, 2,		(uut.REGISTER_FILE.r10 == 2));
		$display("$r11\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r11, uut.REGISTER_FILE.r11, -32'h8, -8, 	(uut.REGISTER_FILE.r11 == -8));
		$display("$r12\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r12, uut.REGISTER_FILE.r12, 32'h7, 7, 		(uut.REGISTER_FILE.r12 == 7));
		$display("$r13\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r13, uut.REGISTER_FILE.r13, 32'h14, 14, 	(uut.REGISTER_FILE.r13 == 14));
		$display("$r14\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r14, uut.REGISTER_FILE.r14, 32'h7, 7, 		(uut.REGISTER_FILE.r14 == 7));
		$display("$r15\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r15, uut.REGISTER_FILE.r15, -32'h4, -4, 	(uut.REGISTER_FILE.r15 == -4));
		$display("$r16\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r16, uut.REGISTER_FILE.r16, 32'h1, 1, 		(uut.REGISTER_FILE.r16 == 1));
		$display("$r17\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r17, uut.REGISTER_FILE.r17, 32'h0, 0, 		(uut.REGISTER_FILE.r17 == 0));
		$display("$r18\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r18, uut.REGISTER_FILE.r18, "X", "X", 		(uut.REGISTER_FILE.r18 == 0));
		$display("$r19\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r19, uut.REGISTER_FILE.r19, "X", "X", 		(uut.REGISTER_FILE.r19 == 0));
		$display("$r20\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r20, uut.REGISTER_FILE.r20, "X", "X",		(uut.REGISTER_FILE.r20 == 0));
		$display("$r21\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r21, uut.REGISTER_FILE.r21, "X", "X", 		(uut.REGISTER_FILE.r21 == 0));
		$display("$r22\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r22, uut.REGISTER_FILE.r22, "X", "X", 		(uut.REGISTER_FILE.r22 == 0));
		$display("$r23\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r23, uut.REGISTER_FILE.r23, "X", "X", 		(uut.REGISTER_FILE.r23 == 0));
		$display("$r24\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r24, uut.REGISTER_FILE.r24, "X", "X", 		(uut.REGISTER_FILE.r24 == 0));
		$display("$r25\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r25, uut.REGISTER_FILE.r25, "X", "X", 		(uut.REGISTER_FILE.r25 == 0));
		$display("$r26\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r26, uut.REGISTER_FILE.r26, "X", "X", 		(uut.REGISTER_FILE.r26 == 0));
		$display("$r27\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r27, uut.REGISTER_FILE.r27, "X", "X", 		(uut.REGISTER_FILE.r27 == 0));
		$display("$r28\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r28, uut.REGISTER_FILE.r28, "X", "X", 		(uut.REGISTER_FILE.r28 == 0));
		$display("$r29\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r29, uut.REGISTER_FILE.r29, "X", "X", 		(uut.REGISTER_FILE.r29 == 0));
		$display("$r30\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r30, uut.REGISTER_FILE.r30, "X", "X",		(uut.REGISTER_FILE.r30 == 0));
		$display("$r31\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r31, uut.REGISTER_FILE.r31, "X", "X", 		(uut.REGISTER_FILE.r31 == 0));

	end
      
endmodule

