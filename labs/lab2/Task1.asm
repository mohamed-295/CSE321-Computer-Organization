# four numbers user input average with loop
.data
    prompt1: .asciiz "Enter first number: "
    prompt2: .asciiz "Enter second number: "
    prompt3: .asciiz "Enter third number: "
    prompt4: .asciiz "Enter fourth number: "
    result: .asciiz "The average is: "
    newline: .asciiz "\n"

.text
main:

    li $t0, 0       # sum 
    li $t1, 0       # counter
    li $t2, 4       # limit

loop:
    beq $t1, $t2, result_out    


    beq $t1, 0, prompt_first
    beq $t1, 1, prompt_second
    beq $t1, 2, prompt_third
    beq $t1, 3, prompt_fourth

prompt_first:
    li $v0, 4
    la $a0, prompt1
    syscall
    j get_input

prompt_second:
    li $v0, 4
    la $a0, prompt2
    syscall
    j get_input

prompt_third:
    li $v0, 4
    la $a0, prompt3
    syscall
    j get_input

prompt_fourth:
    li $v0, 4
    la $a0, prompt4
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