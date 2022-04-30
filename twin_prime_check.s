.data
ms1 : .asciiz "enter first number : "
ms2 : .asciiz "enter second number : "
st1 : .asciiz "yes, twin primes"
st2 : .asciiz "no, not twin primes"

.text
main:

la $a0,ms1
li $v0,4
syscall

li $v0,5
syscall

move $t1,$v0

la $a0,ms2
li $v0,4
syscall

li $v0,5
syscall

move $t2,$v0

li $t3,1
li $t4,1
li $t7,0
li $t8,2

check_1:

addi $t3,1
bge $t3,$t1,check_2

div $t1,$t3
mfhi $t5
beq $t5,$t7,bad_end
j check_1

check_2:

addi $t4,1
bge $t4,$t2,good_end

div $t2,$t4
mfhi $t5
beq $t5,$t7,bad_end
j check_2

good_end:
sub $t3,$t1,$t2
beq $t3,$t8,good_print
sub $t3,$t2,$t1
beq $t3,$t8,good_print

bad_end:
la $a0,st2
li $v0,4
syscall
end:
li $v0,10
syscall

good_print:
la $a0,st1
li $v0,4
syscall
j end
