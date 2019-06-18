`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    program_counter 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////

`include "../../defines/program_counter_defines.v"

module program_counter(clk, d, q, en);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input [N-1:0]  d;
	input clk, en;

	output reg [N-1:0] q;

	initial begin
		q <= `PC_START_ADDRESS;
	end

	always @(posedge clk) begin
		if (en) begin
			q <= d;
		end
		else begin
			q <= q;
		end
	end



   
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
