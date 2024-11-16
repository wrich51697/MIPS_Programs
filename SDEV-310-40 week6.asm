# This code uses a loop to loop through a string and prints one
# characterctor at a time until it hits a null point.

 
.data
string: .asciiz "Hello, World!" # The string to be printed
.text
main:
    la $t0, string # Load the address of the string into $t0
    loop:
        lb $a0, 0($t0)   # Load the byte at the address in $t0 into $a0
        beqz $a0, end    # If the byte is zero, jump to the end of the program
        li $v0, 11       # Set $v0 to 11 (print character)
        syscall          # Print the character in $a0
        
        # Add a one-second delay (adjust the count for your MIPS frequency)
        li $t1, 1000000  # Approximately 1 second delay (adjust as needed)
        delay_loop:
            sub $t1, $t1, 1
            bnez $t1, delay_loop
        
        addi $t0, $t0, 1  # Increment the address in $t0 by 1 (to point to the next character)
        j loop            # Jump back to the beginning of the loop

    end:
        li $v0, 10     # Set $v0 to 10 (exit program)
        syscall        # Exit program

