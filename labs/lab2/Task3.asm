#Write an assembly language program using MIPS architecture to implement switch...case.

.data
    prompt: .asciiz "Enter a number between 1 and 4: "
    case1_msg: .asciiz "First case\n"
    case2_msg: .asciiz "Second case\n"
    case3_msg: .asciiz "Third case\n"
    case4_msg: .asciiz "Fourth case\n"
    default_msg: .asciiz "Invalid input\n"
    newline: .asciiz "\n"

.text
main:
    li $v0,4
    la $a0,prompt
    syscall

    li $v0,5
    syscall
    move $t0,$v0          

switch_case:
    li $t1,1
    beq $t0,$t1,case1

    li $t1,2
    beq $t0,$t1,case2

    li $t1,3
    beq $t0,$t1,case3

    li $t1,4
    beq $t0,$t1,case4

    j default_case

case1:
    li $v0,4
    la $a0,case1_msg
    syscall
    j exit

case2:
    li $v0,4
    la $a0,case2_msg
    syscall 
    j exit

case3:
    li $v0,4
    la $a0,case3_msg
    syscall
    j exit

case4:
    li $v0,4
    la $a0,case4_msg
    syscall
    j exit

default_case:
    li $v0,4
    la $a0,default_msg
    syscall

exit:
    li $v0,10
    syscall