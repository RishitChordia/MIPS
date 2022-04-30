.data
ms1 : .asciiz "enter number : "

.text
main:

la $a0,ms1
li $v0,4
syscall

li $t0,0
li $t1,1
li $v0,5
syscall
move $s0,$v0
li $s1,0
beq $s0,$s1,leave
li $s1,1
beq $s0,$s1,z_leave

addi $s0,-1


li $a0,0
li $v0,1
syscall

li $a0,10
li $v0,11
syscall

li $a0,1
li $v0,1
syscall

li $a0,10
li $v0,11
syscall

func:
addi $s0,-1
li $s1,0
beq $s0,$s1,leave


move $t2,$t1
add $t1,$t1,$t0
move $t0,$t2

move $a0,$t1
li $v0,1
syscall
li $a0,10
li $v0,11
syscall
j func


leave:
li $v0,10
syscall

z_leave:
li $a0,0
li $v0,1
syscall
li $v0,10
syscall
