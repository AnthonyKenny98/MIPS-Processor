`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    main_controller 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "../../../defines/opcode_defines.v"
`include "../../../defines/controller_aluop_defines.v"
`include "../../../defines/funct_defines.v"
`include "../../../defines/control_state_defines.v"

module main_controller(
	// inputs
	clk, Opcode, Funct,
	// outputs
	MemtoReg, RegDst, IorD, PCSrc, Branch, ALUSrcA, ALUSrcB, IRWrite, MemWrite, PCWrite, RegWrite, ALUOp);

	// Input Ports
	input clk;
	input [`OPCODE_WIDTH-1:0] Opcode;
	input [`FUNCT_WIDTH-1:0] Funct;

	// Output Control Signals
	output reg IorD, IRWrite, MemWrite, PCWrite, RegWrite;
	output reg [1:0]  ALUSrcA, PCSrc, RegDst, MemtoReg, Branch;
	output reg [2:0] ALUOp, ALUSrcB;

	reg [3:0] state, next_state;


	initial begin
		state = `CONTROL_STATE_FETCH_1;
	end

	always @(posedge clk) begin
		state <= next_state;
	end

	always @(state, Opcode, Funct) begin
		
		///////////////////////////////////////////////////////////////
		// FETCH STATES
		///////////////////////////////////////////////////////////////

		case (state)
			`CONTROL_STATE_FETCH_1 : begin
				
				// Select Signals
				IorD   = 0;			// 0
				PCSrc = 2'b00; 		// 00
				ALUSrcA = 2'b00; 	// 00
				ALUSrcB = 3'b001;	// 01
				
				// Enable Signals
				IRWrite = 1;	// 1
				MemWrite = 0;	// 0
				PCWrite = 1; 	// 0
				RegWrite = 0;	// 0
				Branch = 2'b00;     // 0
				
				// ALU Control
				ALUOp = `CONTROLLER_ALUOP_ADD;  // 000

				// Next State
				next_state = `CONTROL_STATE_FETCH_2;
			end

			`CONTROL_STATE_FETCH_JR : begin
				
				// Select Signals
				PCSrc = 2'b00; 		// 00
				ALUSrcA = 2'b10; 	// 10
				ALUSrcB = 3'b000;	// 00
				
				// Enable Signals
				IRWrite = 0;	// 0
				MemWrite = 0;	// 0
				PCWrite = 1; 	// 1
				RegWrite = 0;	// 0
				Branch = 2'b00;     // 0

				// AlU Control
				ALUOp = `CONTROLLER_ALUOP_ADD;

				// set next state
				next_state = `CONTROL_STATE_FETCH_2;

			end

			`CONTROL_STATE_FETCH_2 : begin
				
				// Select Signals
				IorD   = 0;			// 0
				PCSrc = 2'b00; 		// 00
				ALUSrcA = 2'b00; 	// 00
				ALUSrcB = 3'b001;	// 01

				// Enable Signals
				IRWrite = 1;	// 1
				MemWrite = 0;	// 0
				PCWrite = 0; 	// 0
				RegWrite = 0;	// 0
				Branch = 2'b00;     // 0

				// ALU Control
				ALUOp = `CONTROLLER_ALUOP_ADD;  // 000

				// Next State
				next_state = `CONTROL_STATE_DECODE;
			end

			///////////////////////////////////////////////////////////////
			// DECODE STATES
			///////////////////////////////////////////////////////////////

			`CONTROL_STATE_DECODE : begin
				// "No control signals are necessary to decode the instruction, 
				// but the FSM must wait 1 cycle for the reading and decoding to complete"
				
				// Select Signals
				ALUSrcA = 2'b00;
				ALUSrcB = 3'b100;

				// Enable Signals
				IRWrite = 0;	// 0 : Keep Instr constant
				MemWrite = 0;	// 0 : Don't write to instr/data memory 
				PCWrite = 0; 	// 0 : Stop incrementing through instruction memory
				RegWrite = 0;	// 0 : Don't write to register file
				Branch = 2'b00;     // 0

				// ALU Control
				ALUOp = `CONTROLLER_ALUOP_ADD;

				// Next State
				case (Opcode)
					// I-Types
					`OPCODE_ANDI : next_state = `CONTROL_STATE_EXECUTE_I;
					`OPCODE_ORI  : next_state = `CONTROL_STATE_EXECUTE_I;
					`OPCODE_XORI : next_state = `CONTROL_STATE_EXECUTE_I;
					`OPCODE_SLTI : next_state = `CONTROL_STATE_EXECUTE_I;
					`OPCODE_ADDI : next_state = `CONTROL_STATE_EXECUTE_I;

					// LW or SW
					`OPCODE_LW : next_state = `CONTROL_STATE_MEM_ADR;
					`OPCODE_SW : next_state = `CONTROL_STATE_MEM_ADR;

					// J -Types
					`OPCODE_J : next_state = `CONTROL_STATE_JUMP;
					`OPCODE_JAL : next_state = `CONTROL_STATE_JUMP;
					`OPCODE_BEQ : next_state = `CONTROL_STATE_BRANCH;
					`OPCODE_BNE : next_state = `CONTROL_STATE_BRANCH;

					// R-Types (including JR)
					default : begin
						case (Funct)
							`FUNCT_SLL : next_state = `CONTROL_STATE_EXECUTE_R_SHIFTS;
							`FUNCT_SRL : next_state = `CONTROL_STATE_EXECUTE_R_SHIFTS;
							`FUNCT_SRA : next_state = `CONTROL_STATE_EXECUTE_R_SHIFTS;
							default : next_state = `CONTROL_STATE_EXECUTE_R;
						endcase
					end
				endcase

			end

			///////////////////////////////////////////////////////////////
			// Jump
			///////////////////////////////////////////////////////////////	

			`CONTROL_STATE_JUMP : begin

				// Select Signals
				PCSrc = 2'b11; 		// 11
				RegDst = 2'b10;     // GPR31
				MemtoReg = 2'b10;   // PC

				// Enable Signals
				IRWrite = 0; 	// 0 :
				MemWrite = 0;	// 0 :
				PCWrite = 1; 	// 1 :
				RegWrite = 1;	// 0 : 
				Branch = 2'b00;     // 0

				// Next State
				next_state = `CONTROL_STATE_FETCH_2;

			end

			///////////////////////////////////////////////////////////////
			// BRANCH
			///////////////////////////////////////////////////////////////	

			`CONTROL_STATE_BRANCH : begin

				// Select Signals
				ALUSrcA = 2'b10;
				ALUSrcB = 3'b000;
				PCSrc = 1;

				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 0;	// 0
				PCWrite = 0; 	// 1
				RegWrite = 0;	// 0
				if (Opcode==`OPCODE_BEQ) begin
					Branch = 2'b01;     
				end else begin
					Branch = 2'b10;
				end
				// ALU Control
				ALUOp = `CONTROLLER_ALUOP_SUB;

				// Next State
				next_state = `CONTROL_STATE_FETCH_1;

			end

			///////////////////////////////////////////////////////////////
			// LW AND SW : MEM_ADR
			///////////////////////////////////////////////////////////////	

			`CONTROL_STATE_MEM_ADR : begin
				
				// Select Signals
				ALUSrcA = 2'b10;	// 1 : Mux outputs register output A 
				ALUSrcB = 3'b010;// 00: Mux outputs SignImm
				
				// Enable Signals
				IRWrite = 0; 	// 0 :
				MemWrite = 0;	// 0 :
				PCWrite = 0; 	// 0 :
				RegWrite = 0;	// 0 : 
				Branch = 2'b00;     // 0
				
				// ALU Control
				ALUOp = `CONTROLLER_ALUOP_ADD;

				// Next State
				case (Opcode)
					`OPCODE_SW : next_state = `CONTROL_STATE_MEM_WRITE;
					default : next_state = `CONTROL_STATE_MEM_READ_1;
				endcase
			end

			///////////////////////////////////////////////////////////////
			// LW : Execution and writeback
			///////////////////////////////////////////////////////////////

			`CONTROL_STATE_MEM_READ_1: begin
				
				// Select Signals
				IorD   = 1;		// 1
				
				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 0;	// 0 
				PCWrite = 0; 	// 0
				RegWrite = 0;	// 0 
				Branch = 2'b00;     // 0

				// Next State
				next_state = `CONTROL_STATE_MEM_READ_2;

			end

			`CONTROL_STATE_MEM_READ_2: begin
				
				// Select Signals
				IorD   = 1;
				
				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 0;	// 0 
				PCWrite = 0; 	// 0
				RegWrite = 0;	// 0
				Branch = 2'b00;     // 0 

				// Next State
				next_state = `CONTROL_STATE_MEM_WRITEBACK;	

			end

			`CONTROL_STATE_MEM_WRITEBACK : begin
				
				// Select Signals
				MemtoReg = 2'b01; 	// 01
				RegDst = 2'b00; // 00
				
				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 0;	// 0
				PCWrite = 0; 	// 0
				RegWrite = 1;	// 1 
				Branch = 0;     // 0

				// Next State
				next_state = `CONTROL_STATE_FETCH_1;

			end

			///////////////////////////////////////////////////////////////
			// SW : MEM_WRITE
			///////////////////////////////////////////////////////////////

			`CONTROL_STATE_MEM_WRITE : begin
				
				// Select Signals
				RegDst = 2'b00; // 0
				IorD   = 1;		// 1

				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 1;	// 1
				PCWrite = 0; 	// 0
				RegWrite = 0;	// 0 
				Branch = 0;     // 0

				// Next State
				next_state = `CONTROL_STATE_FETCH_1;

			end

			///////////////////////////////////////////////////////////////
			// R-TYPE EXECUTION AND WRITEBACK SEQUENCE
			///////////////////////////////////////////////////////////////

			`CONTROL_STATE_EXECUTE_R : begin

				// Select Signals
				ALUSrcA = 2'b10;	// 1 : Mux outputs register output A 
				ALUSrcB = 3'b000;    // 00: Mux outputs register output B
				
				// Enable Signals
				IRWrite = 0; 	// 0 :
				MemWrite = 0;	// 0 :
				PCWrite = 0; 	// 0 :
				RegWrite = 0;	// 0 : 
				Branch = 0;     // 0

				// ALUOP
				ALUOp = `CONTROLLER_ALUOP_FUN; 	// 10: For all R-type instructions

				// Next State
				case (Funct)
					`FUNCT_JR : next_state = `CONTROL_STATE_FETCH_JR;
					default   : next_state = `CONTROL_STATE_WRITEBACK_R;
				endcase
			end

			`CONTROL_STATE_EXECUTE_R_SHIFTS : begin

				// Select Signals
				ALUSrcA = 2'b11;
				ALUSrcB = 3'b011;
				
				// Enable Signals
				IRWrite = 0; 	// 0 :
				MemWrite = 0;	// 0 :
				PCWrite = 0; 	// 0 :
				RegWrite = 0;	// 0 : 
				Branch = 0;     // 0
				
				// ALU Control
				ALUOp = `CONTROLLER_ALUOP_FUN; 	// 10: For all R-type instructions

				// Next State
				next_state = `CONTROL_STATE_WRITEBACK_R;

			end

			`CONTROL_STATE_WRITEBACK_R : begin
				
				// Select Signals
				MemtoReg = 2'b00;	// 00 : Write data coming from ALUOut
				RegDst = 2'b01; // 01 : Write to Instr[15:11]
				
				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 0; 	// 0
				PCWrite = 0; 	// 0
				RegWrite = 1;	// 1 
				Branch = 0;     // 0

				// Next State
				next_state = `CONTROL_STATE_FETCH_1;
			end

			///////////////////////////////////////////////////////////////
			// I-TYPE EXECUTION AND WRITEBACK SEQUENCE
			///////////////////////////////////////////////////////////////

			`CONTROL_STATE_EXECUTE_I : begin

				// Select Signals
				ALUSrcA = 2'b10;	// 1 : Mux outputs register output A 
				ALUSrcB = 3'b010;// 10: Mux outputs register output B
				
				// Enable Signals
				IRWrite = 0; 	// 0 :
				MemWrite = 0;	// 0 :
				PCWrite = 0; 	// 0 :
				RegWrite = 0;	// 0 : 
				Branch = 0;     // 0

				// ALU Control
				case (Opcode)
					// I-Types
					`OPCODE_ANDI : ALUOp = `CONTROLLER_ALUOP_AND;
					`OPCODE_ORI  : ALUOp = `CONTROLLER_ALUOP_OR;
					`OPCODE_XORI : ALUOp = `CONTROLLER_ALUOP_XOR;
					`OPCODE_SLTI : ALUOp = `CONTROLLER_ALUOP_SLT;
					`OPCODE_ADDI : ALUOp = `CONTROLLER_ALUOP_ADD;
					default : ALUOp = `CONTROLLER_ALUOP_AND;
				endcase

				// Next State
				next_state = `CONTROL_STATE_WRITEBACK_I;

			end

			`CONTROL_STATE_WRITEBACK_I : begin
				
				// Select Signals
				MemtoReg = 2'b00;	// 00 : No writing 
				RegDst = 2'b00; // 00 : RT in Register File Write

				// Enable Signals
				IRWrite = 0; 	// 0
				MemWrite = 0; 	// 0
				PCWrite = 0; 	// 0
				RegWrite = 1;	// 1 : Write to Register File
				Branch = 0;     // 0

				// Next State
				next_state = `CONTROL_STATE_FETCH_1;
			end

			default : begin
				next_state = state;
			end
		endcase
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
