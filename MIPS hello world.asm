
.data
string1: .asciiz "Hello, "
string2: .asciiz "world!"
result: .space 20

.text
main:
    la $a0, string1  # Load address of string1 into $a0
    la $a1, string2  # Load address of string2 into $a1
    la $a2, result   # Load address of result into $a2

concat:
    lb $t0, 0($a0)   # Load byte from string1 into $t0
    beqz $t0, done   # Branch to done if end of string1 is reached
    sb $t0, 0($a2)   # Store byte from $t0 into result
    addiu $a0, $a0, 1  # Increment address of string1
    addiu $a2, $a2, 1  # Increment address of result
    j concat         # Jump back to concat

done:
    lb $t0, 0($a1)   # Load byte from string2 into $t0
    beqz $t0, exit   # Branch to exit if end of string2 is reached
    sb $t0, 0($a2)   # Store byte from $t0 into result
    addiu $a1, $a1, 1  # Increment address of string2
    addiu $a2, $a2, 1  # Increment address of result
    j done           # Jump back to done

exit:
    li $v0, 4        # System call code for printing a string
    la $a0, result   # Load address of result into $a0
    syscall          # Print the concatenated string

    li $v0, 10       # System call code for program exit
    syscall          # Terminate the program


