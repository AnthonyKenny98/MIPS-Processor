`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    sign_extend 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "../../defines/instruction_defines.v"

module sign_extend(in, out);

	//parameter definitions
	parameter N = 32;

	// Input
	input wire [`INSTR_IMM_RANGE] in;

	// Ouput
	output wire [N-1:0] out;

	assign out = {{16{in[15]}}, in};




endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
