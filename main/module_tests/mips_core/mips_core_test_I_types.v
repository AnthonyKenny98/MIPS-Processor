`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:26 04/12/2019
// Design Name:   mips_core
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/mips_core_test_I_types.v
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

module mips_core_test_I_types;

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
		$display("$r01\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r01, uut.REGISTER_FILE.r01, 32'h16, 16, 	(uut.REGISTER_FILE.r01 == 16));
		$display("$r02\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r02, uut.REGISTER_FILE.r02, 32'h26, 26, 	(uut.REGISTER_FILE.r02 == 26));
		$display("$r03\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r03, uut.REGISTER_FILE.r03, 32'h26, 26, 	(uut.REGISTER_FILE.r03 == 26));
		$display("$r04\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r04, uut.REGISTER_FILE.r04, 32'h10, 10, 	(uut.REGISTER_FILE.r04 == 10));
		$display("$r05\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r05, uut.REGISTER_FILE.r05, "X", "X", 		(uut.REGISTER_FILE.r05 == 0));
		$display("$r06\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r06, uut.REGISTER_FILE.r06, "X", "X", 		(uut.REGISTER_FILE.r06 == 0));
		$display("$r07\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r07, uut.REGISTER_FILE.r07, "X", "X", 		(uut.REGISTER_FILE.r07 == 0));
		$display("$r08\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r08, uut.REGISTER_FILE.r08, "X", "X", 		(uut.REGISTER_FILE.r08 == 0));
		$display("$r09\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r09, uut.REGISTER_FILE.r09, "X", "X", 		(uut.REGISTER_FILE.r09 == 0));
		$display("$r10\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r10, uut.REGISTER_FILE.r10, "X", "X",		(uut.REGISTER_FILE.r10 == 0));
		$display("$r11\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r11, uut.REGISTER_FILE.r11, "X", "X", 		(uut.REGISTER_FILE.r11 == 0));
		$display("$r12\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r12, uut.REGISTER_FILE.r12, "X", "X", 		(uut.REGISTER_FILE.r12 == 0));
		$display("$r13\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r13, uut.REGISTER_FILE.r13, "X", "X", 		(uut.REGISTER_FILE.r13 == 0));
		$display("$r14\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r14, uut.REGISTER_FILE.r14, "X", "X", 		(uut.REGISTER_FILE.r14 == 0));
		$display("$r15\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r15, uut.REGISTER_FILE.r15, "X", "X",	 	(uut.REGISTER_FILE.r15 == 0));
		$display("$r16\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r16, uut.REGISTER_FILE.r16, "X", "X", 		(uut.REGISTER_FILE.r16 == 0));
		$display("$r17\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r17, uut.REGISTER_FILE.r17, "X", "X", 		(uut.REGISTER_FILE.r17 == 0));
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

