.text
main:
    addi $t0, $zero, 10
    addi $t1, $zero, 20
    add $t2, $t0, $t1
    sub $t3, $t0, $t1
    mul $t4, $t0, $t1
    div $t5, $t0, $t1
    mfhi $t6
    mflo $t7
    j exit

exit:
    li $v0, 10
    syscall
