`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:38 04/14/2019
// Design Name:   mips_core
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/mips_core_test_part2.v
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

module mips_core_test_part2;

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
		$display("$r05\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r05, uut.REGISTER_FILE.r05, 32'h00004000, 16384, 		(uut.REGISTER_FILE.r05 == 16384));
		$display("$r06\t%h\t\t%d\t%h\t\t%d\t\t%b", uut.REGISTER_FILE.r06, uut.REGISTER_FILE.r06, 32'h00400000, 4194304, 		(uut.REGISTER_FILE.r06 == 4194304));
		$display("$r07\t%h\t\t%d\t%h\t\t%d\t\t%b", uut.REGISTER_FILE.r07, uut.REGISTER_FILE.r07, 32'h20010010, 536936464, 		(uut.REGISTER_FILE.r07 == 536936464));

		$display("$r08\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r08, uut.REGISTER_FILE.r08, 32'h100, 256, 	(uut.REGISTER_FILE.r08 == 256));
		$display("$r09\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r09, uut.REGISTER_FILE.r09, 32'h0, 0, 		(uut.REGISTER_FILE.r09 == 0));
		$display("$r10\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r10, uut.REGISTER_FILE.r10, 32'h1, 1,		(uut.REGISTER_FILE.r10 == 1));
		$display("$r11\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r11, uut.REGISTER_FILE.r11, 32'h7, 7, 		(uut.REGISTER_FILE.r11 == 7));
		$display("$r12\t%h\t\t%d\t\t%h\t\t%d\t\t\t%b", uut.REGISTER_FILE.r12, uut.REGISTER_FILE.r12, 32'h5, 5, 		(uut.REGISTER_FILE.r12 == 5));
		
		$display("\nEXECUTING STORE and LOAD INSTRUCTIONS\n");
		$display("Address\t\t Stored Value\tLoaded Value\tEqual?");
		$display("=====\t\t =======\t======\t\t=====");
		$display("%h\t\t%h\t\t%h\t\t%d", 32'h10, 32'h0, uut.REGISTER_FILE.r13, 32'h0==uut.REGISTER_FILE.r13);
		$display("%h\t\t%h\t\t%h\t\t%d", 32'h1e, 32'h1a, uut.REGISTER_FILE.r14, 32'h1a==uut.REGISTER_FILE.r14);
		$display("%h\t\t%h\t\t%h\t\t%d", 32'h100, 32'h5, uut.REGISTER_FILE.r15, 32'h5==uut.REGISTER_FILE.r15);


	end
      
endmodule

