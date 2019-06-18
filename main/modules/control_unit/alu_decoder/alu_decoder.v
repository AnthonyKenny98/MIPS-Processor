`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    alu_decoder 
// Author(s): Grace Eysenbach, Anthony Kenny 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "../../../defines/funct_defines.v"
`include "../../../defines/alu_defines.v"
`include "../../../defines/controller_aluop_defines.v"

module alu_decoder(ALUOp, Funct, ALUControl);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [2:0] ALUOp;
	input wire [5:0] Funct;

	output reg [3:0] ALUControl;

	always @(*) begin
		if (ALUOp == `CONTROLLER_ALUOP_ADD) begin
			ALUControl = `ALU_OP_ADD;
		end else if (ALUOp == `CONTROLLER_ALUOP_SUB) begin
			ALUControl = `ALU_OP_SUB;
		end else if (ALUOp == `CONTROLLER_ALUOP_AND) begin
			ALUControl = `ALU_OP_AND;
		end else if (ALUOp == `CONTROLLER_ALUOP_OR) begin
			ALUControl = `ALU_OP_OR;
		end else if (ALUOp == `CONTROLLER_ALUOP_XOR) begin
			ALUControl = `ALU_OP_XOR;
		end else if (ALUOp == `CONTROLLER_ALUOP_SLT) begin
			ALUControl = `ALU_OP_SLT;
		end else begin
			case (Funct)
				`FUNCT_AND : ALUControl = `ALU_OP_AND;
				`FUNCT_OR : ALUControl = `ALU_OP_OR;
				`FUNCT_XOR : ALUControl = `ALU_OP_XOR;
				`FUNCT_NOR : ALUControl = `ALU_OP_NOR;
				`FUNCT_SLL : ALUControl = `ALU_OP_SLL;
				`FUNCT_SRL : ALUControl = `ALU_OP_SRL;
				`FUNCT_SRA : ALUControl = `ALU_OP_SRA;
				`FUNCT_SLT : ALUControl = `ALU_OP_SLT;
				`FUNCT_ADD : ALUControl = `ALU_OP_ADD;
				`FUNCT_SUB : ALUControl = `ALU_OP_SUB;
				default : ALUControl = `ALU_OP_ADD;
			endcase 
		end
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
