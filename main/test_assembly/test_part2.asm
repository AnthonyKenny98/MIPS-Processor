addi $1, $0, 16
ori $2, $1, 10 	# 16 or 10
ori $3, $2, 16 	# 26 or 16
xori $4, $2, 16  # 26 xor 16 = 10
addi $5, $0, 16384
sll $6, $5, 8
lw $7, 0($6)
addi $8, $0, 256 # $8 = 256
slti $9, $8, 100 # $9 = 0
slti $10, $8, 1000 # $10 = 1
addi $11, $0, 7    # $11 = 7
andi $12, $11, 5   # $12 = 5
sw $0, 0($1)
lw $13, 0($1)
sw $2, 4($2)
lw $14, 4($2)
sw $12, 0($8)
lw $15, 0($8)