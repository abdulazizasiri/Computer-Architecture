#.data

#num: 	.double  12.23
#num2: 	.double  12.23
#num3: 	.float   5.5
#zero:  .double 0.0

#.text

#ldc1 $f2, num
#ldc1 $f4, num2

#div.d $f12, $f2,$f4

#mflo $f1, $f12
#li $v0, 3

#syscall

.data

# receursion tutorial

msg: .asciiz "Enter a number to find it factorial: "

result: .asciiz "\nThe factorial of the number is "

theNumber: .word 0 
theanswer: .word 0 


.text 

main: 


# read he value form the usrer

li $v0, 4
la $a0, msg
syscall 


li $v0, 5
syscall


sw $v0, theNumber

lw $a0,theNumber

 jal findFactorial
  
 sw $v0, theanswer
  
 # displaying the result 
 li $v0, 4
 la $a0, result
 syscall 
 
 li $v0, 1  
 lw $a0, theanswer
 syscall
 
li $v0, 10
syscall

  
  findFactorial:
  subu $sp, $sp, 8
  
  sw $ra, ($sp)
  sw $s0, 4($sp)
  
  
  
  li $v0, 1
  beq $a0, 0, Done
  move $s0, $a0
  
  sub $a0, $a0, 1
  
  jal findFactorial
  
  mul $v0, $s0, $v0
  
  
  
  Done:
  lw $ra, ($sp)
  lw $s0, 4($sp)  
  addu $sp, $sp, 8
  jr $ra
  
