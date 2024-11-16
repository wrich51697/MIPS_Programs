.data
prompt: .asciiz "Enter a number: "
even_msg: .asciiz "even\n"
odd_msg: .asciiz "odd\n"

# text segment
.text
.globl main

# main function
main:
    li $v0, 4               # load print string syscall code into $v0
    la $a0, prompt          # load address of prompt string into $a0
    syscall                 # print prompt string
    li $v0, 5               # load read integer syscall code into $v0
    syscall                 # read integer into $v0
    andi $t0, $v0, 1        # perform bitwise AND with 1 to check for evenness
    beqz $t0, even          # branch to even label if even
    li $v0, 4               # load print string syscall code into $v0
    la $a0, odd_msg             # load address of odd message into $a0
    syscall                 # print odd message
    j end                   # jump to end label
even:
    li $v0, 4               # load print string syscall code into $v0
    la $a0, even_msg            # load address of even message into $a0
    syscall                 # print even message
end:
    li $v0, 10              # load exit syscall code into $v0
    syscall                 # exit program