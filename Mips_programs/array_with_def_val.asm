# this app makes an array with default values
.data 
arr: .word 0:10

line: .asciiz  "\n"
.text

addi $t0, $zero, 0 



for:
bge  $t0, 40,  exit
lw $t6, arr($t0)

li $v0, 1
move $a0, $t6
syscall 


li $v0, 4
la $a0, line
syscall 

addi $t0, $t0, 4

j for


exit:
li $v0, 10 
syscall
