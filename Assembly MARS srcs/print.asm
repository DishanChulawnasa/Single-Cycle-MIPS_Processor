.data
	Message: .asciiz "Hello!"

.text 
	li $v0,4
	la $a0, Message
	syscall
