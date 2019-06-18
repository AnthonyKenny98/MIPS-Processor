`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:29 04/02/2019
// Design Name:   alu_decoder
// Module Name:   Z:/cs141-ProgrammingAssignments/PA4/lab4_start/alu_decoder_test.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "../../../defines/funct_defines.v"
`include "../../../defines/alu_defines.v"

module alu_decoder_test;


	// Inputs
	reg [1:0] ALUOp;
	reg [5:0] Funct;

	// Outputs
	wire [3:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	alu_decoder uut (
		.ALUOp(ALUOp), 
		.Funct(Funct), 
		.ALUControl(ALUControl)
	);

	integer errors;

	initial begin
		// Initialize Inputs
		ALUOp = 0;
		Funct = 0;
		errors = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Funct = `FUNCT_AND;
		#10;
		if (ALUControl != `ALU_OP_AND) begin
			errors = errors + 1;
			$display("ERROR: AND | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_OR;
		#10;
		if (ALUControl != `ALU_OP_OR) begin
			errors = errors + 1;
			$display("ERROR: OR | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_XOR;
		#10;
		if (ALUControl != `ALU_OP_XOR) begin
			errors = errors + 1;
			$display("ERROR: XOR | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_NOR;
		#10;
		if (ALUControl != `ALU_OP_NOR) begin
			errors = errors + 1;
			$display("ERROR: NOR | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_SLL;
		#10;
		if (ALUControl != `ALU_OP_SLL) begin
			errors = errors + 1;
			$display("ERROR: SLL | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_SRL;
		#10;
		if (ALUControl != `ALU_OP_SRL) begin
			errors = errors + 1;
			$display("ERROR: SRL | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_SRA;
		#10;
		if (ALUControl != `ALU_OP_SRA) begin
			errors = errors + 1;
			$display("ERROR: SRA | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_SLT;
		#10;
		if (ALUControl != `ALU_OP_SLT) begin
			errors = errors + 1;
			$display("ERROR: SLT | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_ADD;
		#10;
		if (ALUControl != `ALU_OP_ADD) begin
			errors = errors + 1;
			$display("ERROR: ADD | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end

		Funct = `FUNCT_SUB;
		#10;
		if (ALUControl != `ALU_OP_SUB) begin
			errors = errors + 1;
			$display("ERROR: SUB | FUNCT = %b, ALU_OP = %b", Funct, ALUControl);
		end
	


		$display("ERROR COUNT = %d",errors);

	end
      
endmodule

