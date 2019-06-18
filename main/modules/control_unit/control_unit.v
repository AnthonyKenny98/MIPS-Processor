`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    control_unit 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "../../defines/opcode_defines.v"
`include "../../defines/funct_defines.v"
`include "../../defines/alu_defines.v"
`include "../../defines/control_state_defines.v"

module control_unit(
	// Inputs
	clk, Opcode, Funct,
	// Main Controller Outputs
	MemtoReg, RegDst, IorD, PCSrc, ALUSrcA, ALUSrcB, IRWrite, MemWrite, PCWrite, RegWrite, Branch,
	// ALU Decoder Outputs
	ALUControl);

	// Input Ports
	input clk;
	input [`OPCODE_WIDTH-1:0] Opcode;
	input [`FUNCT_WIDTH-1:0] Funct;

	// Output ports - Select Signals
	output wire IorD;
	output wire [1:0] ALUSrcA, PCSrc, RegDst, MemtoReg;
	output wire [2:0] ALUSrcB;

	// Output ports - Enable Signals
	output wire IRWrite, MemWrite, PCWrite, RegWrite;
	output wire [1:0] Branch;

	// Output ports - ALUControl
	output wire [`ALU_OP_WIDTH-1:0] ALUControl;

	// Internal Wires
	wire [2:0] ALUOp;

	// Main Controller
	main_controller  MAIN_CONTROLLER (	// Inputs
										.clk(clk),
										.Opcode(Opcode),
										.Funct(Funct),
										// Outputs
										.MemtoReg(MemtoReg),
										.RegDst(RegDst),
										.IorD(IorD),
										.PCSrc(PCSrc),
										.Branch(Branch),
										.ALUSrcA(ALUSrcA),
										.ALUSrcB(ALUSrcB),
										.IRWrite(IRWrite),
										.MemWrite(MemWrite),
										.PCWrite(PCWrite),
										.RegWrite(RegWrite),
										.ALUOp (ALUOp));

	// ALU Decoder
	alu_decoder ALU_DECODER (	// Inputs
								.ALUOp(ALUOp),
								.Funct(Funct),
								// Outputs
								.ALUControl(ALUControl));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
