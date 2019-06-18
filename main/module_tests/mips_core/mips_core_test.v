`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:06 04/02/2019
// Design Name:   mips_core
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/mips_core_test.v
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
`include "../../defines/control_state_defines.v"

module mips_core_test;

	parameter N = 32;

	// Inputs
	reg clk;
	reg rstb;

	// Instantiate the Unit Under Test (UUT)
	mips_core uut (
		.clk(clk), 
		.rstb(rstb)
	);

	integer i;
	reg[20*8:0] state;

	initial begin
		// Initialize Inputs
		clk = 0;
		rstb = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		for (i = 0; i <40; i = i + 1) begin
			#100;
			clk = ~clk;
			#100;
			clk = ~clk;
		end

		$display("DUMPING REGISTER FILE");

		uut.REGISTER_FILE.print_hex();

	end

	always @(posedge clk) begin
		#10;

		case(uut.CONTROL_UNIT.MAIN_CONTROLLER.state)
			`CONTROL_STATE_FETCH_1 : state = "FETCH_1";
			`CONTROL_STATE_FETCH_2 : state = "FETCH_2";
			`CONTROL_STATE_DECODE  : state = "DECODE";
			`CONTROL_STATE_EXECUTE_R : state = "EXECUTE_R";
			`CONTROL_STATE_EXECUTE_I : state = "EXECUTE_I";
			`CONTROL_STATE_WRITEBACK_R : state = "WRITEBACK_R";
			`CONTROL_STATE_WRITEBACK_I : state = "WRITEBACK_I";
			`CONTROL_STATE_MEM_ADR	: state = "MEM_ADR";
			`CONTROL_STATE_MEM_READ_1 : state = "MEM_READ_1";
			`CONTROL_STATE_MEM_READ_2 : state = "MEM_READ_2";
			`CONTROL_STATE_MEM_WRITEBACK : state = "MEM_WRITEBACK";
			`CONTROL_STATE_MEM_WRITE : state = "MEM_WRITE";
			`CONTROL_STATE_EXECUTE_R_SHIFTS : state = "EXECUTE_SHIFT";
			`CONTROL_STATE_JUMP : state = "JUMP";
			`CONTROL_STATE_FETCH_JR : state = "FETCH_JR";
			default : state = "unknown";
		endcase 

		$display("%s \tAdr = %h \tMem = %h \tInstr = %h \tTarget Adr = %h",
			state, uut.Adr, uut.MemReadData, uut.Instr, uut.Target_Adr);
	end

      
endmodule

