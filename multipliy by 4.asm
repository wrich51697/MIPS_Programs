.data
    input: .asciiz "Enter an integer: "
    output: .asciiz "Result: "

.text
main:
	# Prompt user for first integer
    li $v0, 4
    la $a0, input
    syscall
	
	# Reads integer
    li $v0, 5
    syscall
    move $t0, $v0
	
	# multiplies by 4 using bitwise shift left
    sll $t0, $t0, 2
	
	# Print results to console
    li $v0, 4
    la $a0, output
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
	
	# terminate the program 
    li $v0, 10
    syscall
