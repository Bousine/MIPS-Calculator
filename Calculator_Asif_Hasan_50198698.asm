	.data
first: .asciiz "input first num:"
second: .asciiz "input second num:"
third:  .asciiz "input operation (1~4,1:+,2:-,3:*,4:/):"
result: .asciiz "result is:"
err:    .asciiz "UNDEFINED OPERATOR!"
		.text
main:
		li $v0, 4
		la $a0, first
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0
		
		li $v0, 4
		la $a0, second
		syscall
		
		li $v0, 5
		syscall
		move $s1, $v0
		
		li $v0, 4
		la $a0, third
		syscall
		
		li $v0, 5
		syscall
		move $s2, $v0
		
		li $v0, 4
		la $a0, result
		syscall
		
		beq $s2, 1, addition
		beq $s2, 2, subtraction
		beq $s2, 3, multiplication
		beq $s2, 4, division
		j default
		
		addition:
			add $a0, $s0, $s1
			li $v0, 1
			syscall
			j main_exit
			
		subtraction:
			sub $a0, $s0, $s1
			li $v0, 1
			syscall
			j main_exit

		multiplication:
			mul $a0, $s0, $s1
			li $v0, 1
			syscall
			j main_exit

		division:
			div $a0, $s0, $s1
			li $v0, 1
			syscall
			j main_exit	
				
		default:
			li $v0, 4
			la $a0, err
			syscall
			j main_exit
		
		main_exit:
			li $v0, 10
			syscall
			