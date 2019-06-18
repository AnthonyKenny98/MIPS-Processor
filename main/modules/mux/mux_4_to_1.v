`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_4_to_1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4_to_1(selector, in00, in01, in10, in11, out);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input wire [1:0] selector;
	input wire [N-1:0] in00, in01, in10, in11;

	wire [N-1:0] mux1_out, mux2_out;

	output wire [N-1:0] out;

	mux_2_to_1 #(.N(N)) MUX1 (	.selector(selector[0]),
								.in0(in00),
								.in1(in01),
								.out(mux1_out));

	mux_2_to_1 #(.N(N)) MUX2 (	.selector(selector[0]),
								.in0(in10),
								.in1(in11),
								.out(mux2_out));

	assign out = selector[1] ? mux2_out : mux1_out;


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
