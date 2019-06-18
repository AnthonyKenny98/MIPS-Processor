`timescale 1ns / 1ps

`default_nettype none //makes undeclared nets errors instead of automatic wires

`define SYNTHESIS

module main(
	//default IO
	input wire unbuf_clk, rstb_button,
	input wire [7:0] switch,
	output wire [7:0] led,
	input wire button_up, button_down, button_right, button_left, button_center
);

parameter N = 32;

//clocking signals
wire cclk, cclk_n;
wire rst, rstb;

//debounce to the nearest 250ms (critical that this is longer than the cpu single step debouncer)
debouncer #(.CYCLES(25_000_000), .COUNTER_WIDTH(32), .RESET_VALUE(1'b0) ) DEBOUNCE_RSTB ( 
	.clk(cclk), .rst(1'b0), .bouncy(rstb_button), .debounced(rstb)
);

assign rst = ~rstb;
assign led = switch; // feel free to use this or any of the other IO devices for help debugging

//generate clock
clock_generator CLOCK_GEN (.clk100M_raw(unbuf_clk), .clk100M(cclk));

//memory
// wire [N-1:0] mem_addr0, mem_rd_addr0, mem_wr_data0, mem_wr_addr1, mem_rd_addr1, mem_wr_data1, mem_addr0, mem_addr1;
// wire [N-1:0] mem_rd_data0, mem_rd_data1;
// wire mem_wr_ena0, mem_wr_ena1;

// assign mem_addr1 = mem_wr_ena1 ? mem_wr_addr1 : mem_rd_addr1;
// synth_dual_port_memory #(.N(32), .I_LENGTH(256), .D_LENGTH(513), .I_WIDTH(8), .D_WIDTH(10)) MEMORY (
// 	.clk(cclk),
// 	.rstb(rstb),
// 	.wr_ena0(mem_wr_ena0),
// 	.addr0(mem_addr0),
// 	.din0(mem_wr_data0),
// 	.dout0(mem_rd_data0),
// 	.wr_ena1(mem_wr_ena1),
// 	.addr1(mem_addr1),
// 	.din1(mem_wr_data1),
// 	.dout1(mem_rd_data1)
// );

// you'll want to make a module for your mips core and interface with the memory module here
mips_core #(.N(N)) MIPS_PROCESSOR (	.clk(cclk),
									.rstb(rstb));

endmodule

`default_nettype wire //disable default_nettype so non-user modules work properly

