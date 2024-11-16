.data
x: .word 0         # Reserve memory for variable x and initialize it to 0
y: .word 0         # Reserve memory for variable y and initialize it to 0
z: .word 0         # Reserve memory for variable z and initialize it to 0
msg: .asciiz "the answer is "  # Declare a null-terminated string message

.text
.globl main         # Define main as a global symbol for program entry

main:
    # Initialize variables
    li $t0, 10      # Load the immediate value 10 into temporary register $t0
    sw $t0, x       # Store the value of $t0 into memory location x
    li $t1, 5       # Load the immediate value 5 into temporary register $t1
    sw $t1, y       # Store the value of $t1 into memory location y
    li $t2, 3       # Load the immediate value 3 into temporary register $t2
    sw $t2, x       # Store the value of $t2 into memory location x

    # Call addit function and store the result in z
    lw $a0, x       # Load the value of x from memory into argument register $a0
    lw $a1, y       # Load the value of y from memory into argument register $a1
    jal addit       # Jump and link to the addit function
    sw $v0, z       # Store the result returned by addit into memory location z

    # Print the result message
    li $v0, 4       # Load the syscall code for printing a string
    la $a0, msg     # Load the address of the message string into $a0
    syscall         # Invoke the syscall to print the string

    # Print the result value
    li $v0, 1       # Load the syscall code for printing an integer
    lw $a0, z       # Load the value of z from memory into $a0
    syscall         # Invoke the syscall to print the integer

    # Exit the program
    li $v0, 10      # Load the syscall code for program exit
    syscall         # Invoke the syscall to exit the program

addit:
    # Add x and y and return the result in v0
    lw $t3, 0($a0)  # Load the value of x from memory into temporary register $t3
    lw $t4, 0($a1)  # Load the value of y from memory into temporary register $t4
    add $v0, $t3, $t4  # Add the values in $t3 and $t4 and store the result in $v0
    jr $ra             # Jump to the return address stored in $ra
