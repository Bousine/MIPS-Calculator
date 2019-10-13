	.data
firstx: .asciiz "input x-coordinate of first point:"
firsty: .asciiz "input y-coordinate of first point:"
secondx: .asciiz "input x-coordinate of second point:"
secondy: .asciiz "input y-coordinate of second point:"
result: .asciiz "euclidean distance is:"
		.text
main:
		li $v0, 4
		la $a0, firstx
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0	#load x1 to $s0
		
		li $v0, 4
		la $a0, firsty
		syscall
		
		li $v0, 5
		syscall
		move $s1, $v0	#load y1 to $s1
		
		sub $s0, $s0, $s1
		
		li $v0, 4
		la $a0, secondx
		syscall
		
		li $v0, 5
		syscall
		move $s1, $v0	#load x2 to $s1
		
		li $v0, 4
		la $a0, secondy
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0	#load y2 to $t0
		
		sub $s1, $s1, $t0
		
		mul $s0, $s0, $s0 	#square of x1-y1
		mul $s1, $s1, $s1 	#square of x2-y2
		add $s0, $s0, $s1	#radicand 
		
		li $t0, -1	#count
		sqrtloop:
			addi $t0, $t0, 1	#increment count
			mul $t1, $t0, $t0	#square the count and load to $t1
			bne $t1, $s0, sqrtloop	#loop if radicand and count-squared are not equal
		
		move $s0, $t0	#move the final square root value to $s0
		
		li $v0, 4
		la $a0, result
		syscall
		
		move $a0, $s0
		main_exit:
			li $v0, 1
			syscall
			li $v0, 10
			syscall
		