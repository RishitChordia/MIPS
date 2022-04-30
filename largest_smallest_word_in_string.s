.data
st1 : .space 1000
ms : .asciiz "enter string: "
ms1 : .asciiz "largest word : "
ms2 : .asciiz "smallest word : "

.text
main:
la $a0,ms
li $v0,4
syscall

la $a0,st1
li $a1,1000
li $v0,8
syscall

# t0 is current count t1 is beginning of current word
# t9 is current largest word t8 is current largest length
# t7 is current smallest word t6 is current smallest length
# t2 is used for traversing through string
# t3-5 available for use for characters and all



li $t6,999999
li $t8,0
la $t2,st1
li $t0,0
la $t1,st1

func:
lb $t3,0($t2)
beq $t3,32,end_word
beq $t3,10,end_word
addi $t0,$t0,1
addi $t2,$t2,1
j func

end_word:
bgt $t0,$t8,change_large
changed_large:
blt $t0,$t6,change_small
changed_small:
beq $t3,10,end
li $t0,0
addi $t2,$t2,1
move $t1,$t2
j func

change_large:
move $t9,$t1
move $t8,$t0
j changed_large

change_small:
move $t7,$t1
move $t6,$t0
j changed_small






end:
la $a0,ms1
li $v0,4
syscall

print_large:
lb $a0,0($t9)
beq $a0,32,end_large
li $v0,11
syscall
addi $t9,$t9,1  

j print_large

end_large:
li $a0,10
li $v0,11
syscall

la $a0,ms2
li $v0,4
syscall

print_small:
lb $a0,0($t7)
beq $a0,32,end_small
li $v0,11
syscall
addi $t7,$t7,1
j print_small

end_small:
li $a0,10
li $v0,11
syscall

li $v0,10
syscall
