.data
array: .space 16
prompt: .asciiz "Enter a number: "
.text

main:

addi $t0, $zero, 0 ## inputing
addi $t1, $zero, 0 # added
addi $s1, $zero, 0 # added

while:

bge $t0, 16, exit
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall

sw $v0, array($t0)

addi $t0, $t0, 4
j while

addi $t0, $zero, 0 



exit:

bge $t1, 16, print
lw $s0, array($t1)
add $s1, $s1, $s0
addi $t1, $t1, 4

j exit 
 
print:

li $v0, 1
move $a0, $s1
syscall
li $v0, 10
syscall
