.data
st1 : .space 1000
st2 : .space 1000
st3 : .space 1000
ms1 : .asciiz "enter first string : "
ms2 : .asciiz "enter second string : "
msg : .asciiz "combined string : "

.text
main:
la $a0,ms1
li $v0,4
syscall

la $a0,st1
li $a1,1000
li $v0,8
syscall

la $a0,ms2
li $v0,4
syscall

la $a0,st2
li $a1,1000
li $v0,8
syscall

la $t1,st1
la $t9,st3
li $t7,10

add_1:
lb $t8,0($t1)
beq $t8,10,end_1
addi $t1,$t1,1
sb $t8,0($t9)
addi $t9,$t9,1
j add_1

end_1:

la $t1,st2

add_2:
lb $t8,0($t1)
beq $t8,10,end_2
addi $t1,$t1,1
sb $t8,0($t9)
addi $t9,$t9,1
j add_2

end_2:
addi $t9,$t9,1
li $a0,0
sb $a0,0($t9)

la $a0,msg
li $v0,4
syscall


la $a0,st3
li $v0,4
syscall


li $v0,10
syscall