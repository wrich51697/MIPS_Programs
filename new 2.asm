.data
x: .word 7    # Define integer variable x with value 7
y: .word 0    # Define integer variable y (initialize to 0)
msg1: .asciiz "Result is: "
lf: .asciiz "\n"

.text
.globl main

main:
    # Register assignments
    # $s0 = x
    # $s1 = y

    # Initialize registers
    lw $s0, x       # Reg $s0 = x
    lw $s1, y       # Reg $s1 = y

    # Call function
    move $a0, $s0   # Argument 1: x ($s0)
    jal fun         # Call the function fun
    move $s1, $v0   # Store the return value from fun in $s1 (y)

    # Print msg1
    li $v0, 4        # print_string syscall code = 4
    la $a0, msg1     # Load address of msg1 into $a0
    syscall          # Print the message

    # Print result (y)
    li $v0, 1        # print_int syscall code = 1
    move $a0, $s1    # Load y (result) into $a0
    syscall          # Print the result as an integer

    # Print newline
    li $v0, 4        # print_string syscall code = 4
    la $a0, lf       # Load address of newline character into $a0
    syscall          # Print a newline

    # Exit
    li $v0, 10       # exit syscall code = 10
    syscall          # Exit the program

fun:
    # Function definition
    addi $sp, $sp, -4  # Allocate space on the stack
    sw $s0, 0($sp)     # Save $s0 on the stack
    addi $sp, $sp, -4  # Allocate more space on the stack
    sw $s1, 0($sp)     # Save $s1 on the stack

    li $s0, 3          # Set $s0 = 3
    mul $s1, $s0, $a0  # $s1 = $s0 * $a0 (argument passed to fun)
    addi $s1, $s1, 5   # $s1 = $s1 + 5

    move $v0, $s1      # Set the return value in $v0

    lw $s1, 0($sp)     # Restore $s1 from the stack
    addi $sp, $sp, 4   # Deallocate the saved $s1 from the stack
    lw $s0, 0($sp)     # Restore $s0 from the stack
    addi $sp, $sp, 4   # Deallocate the saved $s0 from the stack

    jr $ra             # Return from the function
