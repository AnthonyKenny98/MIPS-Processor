`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    double_register 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module double_register(clk, rst, ena, dA, dB, qA, qB);

	//	Parameter definitions
	parameter N = 32;

	// Input Ports
	input wire clk, rst, ena;
	input wire [N-1:0] dA, dB;

	// Outut Ports
	output wire [N-1:0] qA, qB;



	// A Register
	register #(.N(N)) A_REGISTER (	.clk(clk),
									.rst(rst),
									.ena(ena),
									.d(dA),
									.q(qA));

	// B Register
	register #(.N(N)) B_REGISTER (	.clk(clk),
									.rst(rst),
									.ena(ena),
									.d(dB),
									.q(qB));


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
