# MIPS-Processor

![Circuit Diagram](https://github.com/AnthonyKenny98/MIPS-Processor/blob/master/main/Circuit%20Diagram.png)

## Main
Contains the code modules for each component of the processor, the test assembly files, the module tests, and all other verilog files neccesary to simulate a MIPS processor. The processor supports the following:

*R-Types*
– and 
– or 
– xor 
– nor 
– sll 
– srl 
– sra 
– slt 
– add 
– sub
*I-types*
– andi 
– ori 
– xori 
– slti 
– addi 
– beq
– bne 
– lw
– sw
*J-types*
–j
– jal
– jr (technically an R-type, but we’ll include it here because it’s a jump)
*nop*


## Assembler
Contains the code to convert assembly language to machine code
