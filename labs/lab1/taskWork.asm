.data
name: .asciiz "Name:   Mohamed Adel\n"
id: .asciiz "ID:     20812022100415\n"
course: .asciiz "Course: CSE321-Computer-Organization\n"

.text
main:
    # print name
    li $v0, 4        
    la $a0, name       
    syscall            

    # print id
    li $v0, 4         
    la $a0, id        
    syscall            

    # print course
    li $v0, 4        
    la $a0, course    
    syscall            

    # exit program
    li $v0, 10         
    syscall            