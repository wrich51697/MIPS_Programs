.data
    prompt1: .asciiz "Enter the first integer: "
    prompt2: .asciiz "Enter the second integer: "
    product: .asciiz "Product: "
    quotient: .asciiz "Quotient: "
    sum: .asciiz "Sum: "
    difference: .asciiz "Difference: "
	newline: .asciiz "\n"

.text
main:
    # Prompt user for first integer
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read first integer
    li $v0, 5
    syscall
    move $t0, $v0

    # Prompt user for second integer
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read second integer
    li $v0, 5
    syscall
    move $t1, $v0

    # Calculate product of two integers
    mult $t0, $t1
    mflo $t2

    # Calculate quotient of two integers
    div $t0, $t1
    mflo $t3

    # Calculate sum of two integers
    add $t4, $t0, $t1

    # Calculate difference of two integers
    sub $t5, $t0, $t1

    # Print results to console
    li $v0, 4
    la $a0, product
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
	
	 # Print newline 
     li $v0, 4 
     la $a0, newline 
     syscall 

    li $v0, 4
    la $a0, quotient
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
	
	 # Print newline 
     li $v0, 4 
     la $a0, newline 
     syscall 

    li $v0, 4
    la $a0, sum
    syscall
    li $v0, 1
    move $a0, $t4
    syscall
	
	 # Print newline 
     li $v0 , 4 
     la $a0, newline 
     syscall 

     li $v0, 4 
     la $a0, difference
     syscall 
     li $v0, 1 
     move $a0,$t5 
     syscall 
	 
exit:

     li $v0,10  
     syscall   # terminate the program 
