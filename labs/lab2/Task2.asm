.data
    prompt_n: .asciiz "Enter the number of integers you want to average (n): "
    prompt: .asciiz "Enter number: "
    result: .asciiz "The average is: "
    newline: .asciiz "\n"

.text
main:

    move $t0, $zero       # sum 
    move $t1, $zero       # counter

get_n:
    li $v0,4
    la $a0,prompt_n
    syscall

    li $v0,5
    syscall
    move $t2,$v0  


loop:
    beq $t1, $t2, result_out    

prompt_num:
    li $v0, 4
    la $a0, prompt
    syscall
    j get_input


get_input:
    li $v0, 5
    syscall
    add $t0, $t0, $v0
    addi $t1, $t1, 1
    j loop

result_out:

    mtc1 $t0, $f0
    cvt.s.w $f0, $f0

    mtc1 $t2, $f1
    cvt.s.w $f1, $f1



    li $v0, 4
    la $a0, result
    syscall

    div.s $f12, $f0, $f1
    li $v0, 2
    syscall

    li $v0, 4
    la $a0, newline
    syscall


exit:
    li $v0, 10
    syscall