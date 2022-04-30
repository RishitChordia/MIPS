.data
st1 : .space 1000
st2 : .space 1000
st3 : .space 1000
ms1 : .asciiz "enter string: "
ms2 : .asciiz "enter word to be replaced : "
ms3 : .asciiz "enter replacement word : "
ms4 : .asciiz "final string : "

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

la $a0,ms3
li $v0,4
syscall

la $a0,st3
li $a1,1000
li $v0,8
syscall

la $a0,ms1
li $v0,4
syscall

# t1 is beginning of current word
# t2 is used for traversing through string
# t9 traverses through word to be found to compare each character
# t4 stores current character in string and t5 current character in word to be found
# rest available for use for comparison and characters

la $t2,st1
la $t1,st1
la $t9,st2

func:
lb $t4,0($t2)
lb $t5,0($t9)
beq $t4,32,check_if_found
beq $t4,10,check_if_found
beq $t5,10,word_not_found
bne $t4,$t5,word_not_found

addi $t9,$t9,1
addi $t2,$t2,1
j func


check_if_found:
beq $t5,10,word_found

word_not_found:

print_not:
lb $a0,0($t1)
beq $a0,10,end
beq $a0,32,end_not
li $v0,11
syscall
addi $t1,$t1,1
j print_not

end_not:
li $a0,32
li $v0,11
syscall

addi $t1,$t1,1
move $t2,$t1
la $t9,st2
j func


word_found:

la $t1,st3
print_is:
lb $a0,0($t1)
beq $a0,10,end_is
beq $a0,32,end_is
li $v0,11
syscall
addi $t1,$t1,1
j print_is

end_is:
li $a0,32
li $v0,11
syscall

beq $t4,10,end
addi $t2,$t2,1
move $t1,$t2
la $t9,st2
j func

end:
li $v0,10
syscall


