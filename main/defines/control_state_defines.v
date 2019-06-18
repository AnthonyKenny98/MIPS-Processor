`ifndef CONTROL_STATE_DEFINES
`define CONTROL_STATE_DEFINES
`define CONTROL_STATE_FETCH_1 	4'b0000
`define CONTROL_STATE_FETCH_2 	4'b0001
`define CONTROL_STATE_DECODE 	4'b0010
`define CONTROL_STATE_EXECUTE_R 4'b0011
`define CONTROL_STATE_EXECUTE_I 4'b0101
`define CONTROL_STATE_WRITEBACK_R 4'b0100
`define CONTROL_STATE_WRITEBACK_I 4'b0110
`define CONTROL_STATE_MEM_ADR	4'b0111
`define CONTROL_STATE_MEM_READ_1	4'b1000
`define CONTROL_STATE_MEM_READ_2	4'b1001
`define CONTROL_STATE_MEM_WRITEBACK 4'b1010
`define CONTROL_STATE_MEM_WRITE 4'b1011
`define CONTROL_STATE_EXECUTE_R_SHIFTS 4'b1100
`define CONTROL_STATE_JUMP 4'b1101
`define CONTROL_STATE_FETCH_JR 4'b1110
`define CONTROL_STATE_BRANCH 4'b1111

`endif
