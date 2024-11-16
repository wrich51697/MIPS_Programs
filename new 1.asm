.data
message: .asciiz "Result is: "  # Define a null-terminated string message

.text
.globl main

main:
    # Load values into registers $t0 and $t1
    li $t0, 5          # Load the integer 5 into register $t0
    li $t1, 10         # Load the integer 10 into register $t1
    
    # Perform a bitwise AND operation on the two registers and store the result in $t2
    and $t2, $t0, $t1
    
    # Print the result
    li $v0, 4           # Load system call code 4 into $v0 (print string)
    la $a0, message     # Load the address of the message string into $a0
    syscall             # Execute the print string system call
    
    move $a0, $t2       # Move the value in $t2 (result) to $a0 (print argument)
    li $v0, 1           # Load system call code 1 into $v0 (print integer)
    syscall             # Execute the print integer system call
    
    # Exit the program
    li $v0, 10          # Load system call code 10 into $v0 (exit)
    syscall             # Execute the exit system call
