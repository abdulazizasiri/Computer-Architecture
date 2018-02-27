#  This is for doing floating point arthmetic.


.data 

number3: .double 3.141
number4: .double 3.141

number1: .float 3.14
number2: .float 3.14
string: .asciiz "\n"
msg: .asciiz "Double: "
msg2: .asciiz "Float:  "

.text



# with double reserve 2 per one
ldc1 $f4, number3
ldc1 $f8, number4

add.d $f12, $f4, $f8


li $v0, 4
la $a0, msg
syscall

 li $v0, 3
syscall 


li $v0, 4
la $a0, string
syscall

lwc1 $f0, number1
lwc1 $f1, number2
 
 li $v0, 4
la $a0, msg2
syscall

 add.s $f12, $f0, $f1
 li $v0, 2
syscall 



