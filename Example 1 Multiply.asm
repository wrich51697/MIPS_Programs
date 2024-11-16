.data
output1: .asciiz "Enter a number as a float: "
prompt2: .asciiz "Enter a percentage to multiply by as a decimal: "
result: .asciiz "Answer: "

.text
.globl main
main:
    # Enter the number to multiply
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Read the number to multiply
    li $v0, 6
    syscall
    mov.s $f0, $f0
    
    # Enter the percent
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Read the percentage
    li $v0, 6
    syscall
    mov.s $f1, $f0
    
    # do the nultiplication and store in $f2
    mul.s $f2, $f0, $f1
    
    # Print result
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 2
    mov.s $f12, $f2
    syscall
    
     
    # Exit 
    li $v0, 10
    syscall