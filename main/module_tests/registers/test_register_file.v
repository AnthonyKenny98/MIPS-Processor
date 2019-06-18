`default_nettype none
`timescale 1ns/1ps

module test_register_file;

parameter N = 32;

reg  clk, rst;
reg [4:0] rd_addr0, rd_addr1, wr_addr;
wire [N-1:0] rd_data0, rd_data1;
reg [N-1:0] wr_data;
reg  wr_ena;

register_file #(.N(32)) UUT (
	.clk(clk),
	.rst(rst),
	.rd_addr0(rd_addr0),
	.rd_addr1(rd_addr1),
	.wr_addr(wr_addr),
	.rd_data0(rd_data0),
	.rd_data1(rd_data1),
	.wr_data(wr_data),
	.wr_ena(wr_ena)
);

integer i, j, errors = 0;

initial begin
	clk = 0;
	rst = 0;
	rd_addr0 = 0;
	rd_addr1 = 0;
	wr_addr = 0;
	wr_data = 0;
	wr_ena = 0;
	
	rst = 1;
	@(posedge clk); 
	@(negedge clk) rst = 0;
	
	/* load values into the register file
		- unique non-zero value per register
		- attempts to load into R00 (should still read out 00)
	*/
	
	for (i = 0; i < 32; i = i + 1) begin
		@(negedge clk);
		wr_ena  = 1;
		wr_addr = i;
		wr_data = (i+1)*17;
	end
	@(posedge clk) wr_ena = 0;
	
	/* read out values from the register file on both channels
		- make sure zero is zero for both read channels
	*/
	for (i = 0; i < 32; i = i + 1) begin
		j = 31 - i;
		@(negedge clk);
		rd_addr0 = i;
		rd_addr1 = j;
		@(posedge clk);
		$display("R%02d : %h, R%02d : %h", rd_addr0, rd_data0, rd_addr1, rd_data1);
		//check channel 0 
		if (i == 0) begin
			if(rd_data0 !== 0) begin
				$display("!ERROR: R00 should be zero on rd_data0!");
				errors = errors + 1;
			end
		end
		else begin
			if(rd_data0 !== (i+1)*17) begin
				$display("!ERROR rd_addr = %02d = %h, should be %h", rd_addr0, rd_data0, (i+1)*17);
				errors = errors + 1;
			end
		end
		//check channel 1
		if (j == 0) begin
			if(rd_data1 !== 0) begin
				$display("!ERROR: R00 should be zero on rd_data1!");
				errors = errors + 1;
			end
		end
		else begin
			if(rd_data1 !== (j+1)*17) begin
				$display("!ERROR rd_addr = %02d = %h, should be %h", rd_addr0, rd_data0, (j+1)*17);
				errors = errors + 1;
			end
		end
	end
	
	if(errors == 0) begin
		$display("\nSUCCESS: test completed without errors");
	end
	else begin
		$display("\nFAILURE: test completed with %d errors", errors);
	end
	$finish;
end

always #5 clk = ~clk;


endmodule

`default_nettype wire
