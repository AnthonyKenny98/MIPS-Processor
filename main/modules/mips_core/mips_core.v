 `timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mips_core 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "../../defines/alu_defines.v"
`include "../../defines/funct_defines.v"
`include "../../defines/opcode_defines.v"
`include "../../defines/instruction_defines.v"
`include "../../defines/program_counter_defines.v"

module mips_core(
	// Inputs
	clk, rstb);

	// Parameter definitions
	parameter N = 32;

	// Input Ports
	input clk, rstb;
	
	/////////////////////////DEVELOPMENT////////////////////////
	// zero register for things we dont want to reset (maybe)
	reg zero;
	////////////////////////////////////////////////////////////
	
	// Control Unit - Select Signals
	wire IorD;
	wire [1:0] ALUSrcA, PCSrc, RegDst, MemtoReg;
	wire [2:0] ALUSrcB;

	// Control Unit - Enable Signals
	wire IRWrite, MemWrite, PCWrite, RegWrite;
	wire [1:0] Branch;

	// Control Unit - ALUControl
	wire [`ALU_OP_WIDTH-1:0] ALUControl;

	// Control Signal
	wire PCEn;

	// Data Bus Wires
	wire [N-1:0] Adr;
	wire [N-1:0] MemWriteData, MemReadData;
	wire [N-1:0] PCnext, PC;
	wire [N-1:0] RegisterRD1, RegisterRD2;
	wire [N-1:0] A, B;
	wire [N-1:0] SrcA, SrcB;
	wire [N-1:0] ALUResult, ALUOut;
	wire [N-1:0] SignImm, SLL2SignImm;
	wire [N-1:0] Data, RegFileWrite;
	wire [N-1:0] Shamt;
	wire [N-1:0] Target_Adr;

	// Uncategorized
	wire Zero;
	wire [N-1:0] Instr;
	wire [`INSTR_REG_WIDTH-1:0] RegDstWire;

	// Instr/Data Memory
	synth_dual_port_memory #(
		.N(32),
		.I_LENGTH(1024),
		.D_LENGTH(1024)) MEMORY(// Inputs
								.clk(clk),
								.rstb(rstb),
								.wr_ena0(MemWrite),
								.addr0(Adr),
								.din0(MemWriteData),
								// Outputs
								.dout0(MemReadData));

	// PC Register
	program_counter #(.N(N)) PROGRAM_COUNTER ( 	// Inputs
												.clk(clk),
												.en(PCEn),
												.d(PCnext),
												// Outputs
												.q(PC));

	// Address Mux
	mux_2_to_1 #(.N(N)) ADR_MUX (	// Inputs
									.in0(PC),
									.in1(ALUOut),
									.selector(IorD),
									// Output
									.out(Adr));


	// Instruction Register
	register #(.N(N)) INSTR_REGISTER (	// Inputs
										.clk(clk),
										.rst(zero),
										.ena(IRWrite),
										.d(MemReadData),
										// Outputs
										.q(Instr));

	// Data Register
	register #(.N(N)) DATA_REGISTER (	// Inputs
										.clk(clk),
										.rst(zero),
										.ena(~zero),
										.d(MemReadData),
										// Outputs
										.q(Data));

	
	// Control Unit
	control_unit CONTROL_UNIT ( // Inputs
								.clk(clk),
								.Opcode(Instr[`INSTR_OP_RANGE]),
								.Funct(Instr[`FUNCT_WIDTH-1:0]),
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
								.ALUControl(ALUControl));

	// Register File
	register_file #(.N(N)) REGISTER_FILE (	// Inputs 
											.clk(clk),
											.rst(zero),
											.rd_addr0(Instr[`INSTR_RS_RANGE]),
											.rd_addr1(Instr[`INSTR_RT_RANGE]),
											.wr_addr (RegDstWire),
											.wr_data (RegFileWrite),
											.wr_ena(RegWrite),
											// Outputs
											.rd_data0(RegisterRD1),
											.rd_data1(RegisterRD2));

	// Register File Output Register
	double_register #(.N(N)) REGISTER_FILE_OUTPUT_REGISTER (// inputs 
															.clk(clk),
															.rst(zero),
															.ena(~zero),
															.dA(RegisterRD1),
															.dB(RegisterRD2),
															// outputs
															.qA(A),
															.qB(B));

	// Register Destination Wire Mux
	mux_4_to_1 #(.N(`INSTR_REG_WIDTH)) REG_DST_MUX (// inputs
													.selector(RegDst),
													.in00(Instr[`INSTR_RT_RANGE]),
													.in01(Instr[`INSTR_RD_RANGE]),
													.in10(5'b11111),
													.in11(),
													// Ouput
													.out(RegDstWire));

	// Register Write Mux
	mux_4_to_1 #(.N(N)) REG_WR_MUX (// Inputs
									.selector(MemtoReg),
									.in00(ALUOut),
									.in01(Data),
									.in10(PC),
									.in11(),
									// Outputs
									.out(RegFileWrite));
	// SrcA Mux
	mux_4_to_1 #(.N(N)) SrcA_MUX (	// Inputs
									.selector(ALUSrcA),
									.in00(PC),
									.in01(),
									.in10(A),
									.in11(B),
									// Outputs
									.out(SrcA));

	// SrcB Mux
	mux_8_to_1 #(.N(N)) SrcB_MUX (	// Inputs
									.selector(ALUSrcB),
									.in000(B),
									.in001(`INSTR_INCREMENT),
									.in010(SignImm),
									.in011(Shamt),
									.in100(SLL2SignImm),
									// Output
									.out(SrcB));

	// ALU
	alu #(.N(N)) ALU (	// Inputs
						.x(SrcA),
						.y(SrcB),
						.op_code(ALUControl),
						// Outputs
						.z(ALUResult),
						.equal(),
						.zero(Zero),
						.overflow());

	// ALU Out Register
	register #(.N(N)) ALU_OUT_REG (	// Inputs
									.clk(clk),
									.rst(zero),
									.ena(~zero),
									.d(ALUResult),
									// Output
									.q(ALUOut));

	// PCSrc Mux
	mux_4_to_1 #(.N(N)) PCSrc_MUX (	// Inputs
									.selector(PCSrc),
									.in00(ALUResult),
									.in01(ALUOut),
									.in10(),
									.in11(Target_Adr),
									// Output
									.out(PCnext));
	
	// Sign Extender Module
	sign_extend #(.N(N)) SIGN_EXTEND (	// Inputs
										.in(Instr[`INSTR_IMM_RANGE]),
										// Outputs
										.out(SignImm));

	// Real assignments
	assign PCEn = PCWrite | ((~Branch[1]&Branch[0]&Zero)  | (Branch[1]&~Branch[0]&~Zero));

	// Zero Extend Module
	assign Shamt = {{27{1'b0}}, Instr[`INSTR_SA_RANGE]};

	// Shift Left 2 Module
	assign Target_Adr = {PC[`PC_4MSB_RANGE], Instr[`INSTR_INDEX_RANGE] << 2};
	assign SLL2SignImm = SignImm << 2;

	assign MemWriteData = B;

	initial begin
		zero <= 0;
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
