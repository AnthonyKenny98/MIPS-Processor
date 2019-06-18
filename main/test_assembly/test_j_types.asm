			addi $1, $0, 1
			addi $4, $0, 0
			
			j SKIPONE           # testing j skips next line
			addi $2, $0, 1

SKIPONE: 	addi $2, $0, 2
			
			addi $3, $0, 16384  
			sll $3, $3, 8		# $3 = PC start addr
			addi $3, $3, 44		# $3 = line 15
			jr $3
			nop					#
			addi $4, $4, 1		# jr should skip these two lines
			addi $4, $4, 5		# line that jr should jump to

			jal KICKBACK
			addi $6, $0, 12

			addi $7, $0, 0			# $7=0
LOOPONE:    beq $7, $6, BREAKONE	# for ($7<12) $7++
			addi $7, $7, 1
			j LOOPONE

BREAKONE:	addi $8, $0, 8

			addi $9, $0, 0			# $9=0
			addi $10, $0, 100		# $10 = 100
LOOPTWO:	addi $9, $9, 1
			bne $9, $10, LOOPTWO
			addi $11, $0, 11
			j END			

KICKBACK:	addi $5, $0, 12
			jr $31

END: 		nop