`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:32 04/02/2019
// Design Name:   main_controller
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/main_controller_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_controller_test;

	// Inputs
	reg clk;
	reg [5:0] Opcode;

	// Outputs
	wire MemtoReg;
	wire RegDst;
	wire PCSrc;
	wire ALUSrcA;
	wire [1:0] ALUSrcB;
	wire IRWrite;
	wire PCWrite;
	wire RegWrite;
	wire [1:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	main_controller uut (
		.clk(clk), 
		.Opcode(Opcode), 
		.MemtoReg(MemtoReg), 
		.RegDst(RegDst), 
		.PCSrc(PCSrc), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.IRWrite(IRWrite), 
		.PCWrite(PCWrite), 
		.RegWrite(RegWrite), 
		.ALUOp(ALUOp)
	);

	integer i;

	initial begin
		// Initialize Inputs
		clk = 0;
		Opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i=1; i < 31; i = i + 1) begin
			#50;
			clk = ~clk;
		end
	end

	always @(posedge clk) begin
		$display("i = %d, state = %b",i/2, uut.state);
	end
      
endmodule

