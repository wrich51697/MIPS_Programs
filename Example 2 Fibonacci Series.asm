.data
usermsg: .asciiz "Fibonacci program!  Enter a number: "
results: .asciiz "The Fibonacci results: "
comma: .asciiz ","
.text
.globl main

main:
    li $v0, 4               # li (Load instruction) print string syscall (4) goes into register $v0
    la $a0, usermsg         # load address of prompt string into $a0
    syscall                 # print prompt string
    li $v0, 5               # load read integer syscall (5) to  $v0
    syscall                 # put integer into $v0
    move $t0, $v0           # put the input value in $t0
    li $t1, 0               # init value 1 to 0
    li $t2, 1               # init value 2 to 1
    li $v0, 4               # print string syscall 
    la $a0, results         # load address of results variable  into $a0
    syscall                 # print results
    loop:
        beq $t0, $zero, end  # if  $t0 = 0 then series complete and exit by going to end: tag
        move $a0, $t1        # move value Fibonacci value 1 to $a0
        li $v0, 1            # 
        syscall              # Fibonacci to the console
        add $t3, $t1, $t2    # sum 1 and 2 and store  in $t3
        move $t1, $t2        # move value $t1 into $t2 
        move $t2, $t3        # 
        sub $t0, $t0, 1      # decrement counter $t0
        li $v0, 4            #
        la $a0, comma        # Put a comma in between numbers. Try to modify this to use a data value!
        syscall              # print comma to the console
        j loop               # jump to loop:
    end:
    li $v0, 10              # load exit system call (10) $v0
    syscall                 # end program