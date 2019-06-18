`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_2_to_1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2_to_1(selector, in0, in1, out);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input  wire selector;
	input  wire [N-1:0] in0; // input to return when relevant op_code bit is low
	input  wire [N-1:0] in1; // input to return when relevant op_code bit is high

	output wire [N-1:0] out;

	assign out = selector ? in1 : in0;


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
