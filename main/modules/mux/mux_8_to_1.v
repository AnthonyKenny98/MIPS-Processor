`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_6_to_1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_8_to_1(selector, in000, in001, in010, in011, in100, in101, in110, in111, out);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input wire [2:0] selector;
	input wire [N-1:0] in000, in001, in010, in011, in100, in101, in110, in111;

	wire [N-1:0] mux1_out, mux2_out;

	output wire [N-1:0] out;

	mux_4_to_1 #(.N(N)) MUX1 (	.selector(selector[1:0]),
								.in00(in000),
								.in01(in001),
								.in10(in010),
								.in11(in011),
								.out(mux1_out));

	mux_4_to_1 #(.N(N)) MUX2 (	.selector(selector[1:0]),
								.in00(in100),
								.in01(in101),
								.in10(in110),
								.in11(in111),
								.out(mux2_out));

	assign out = selector[2] ? mux2_out : mux1_out;


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
