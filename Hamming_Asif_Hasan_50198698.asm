	.data
first: .asciiz "input first num:"
second: .asciiz "input second num:"
result: .asciiz "hamming distance is:"
err:    .asciiz "LENGTH OF NUMBER NOT TWO!"
		.text
main:
		li $v0, 4
		la $a0, first
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0
		
		blt $s0, 10, error_exit
		bge $s0, 100, error_exit
		
		li $v0, 4
		la $a0, second
		syscall
		
		li $v0, 5
		syscall
		move $s1, $v0
		
		blt $s1, 10, error_exit
		bge $s1, 100, error_exit
		
		li $v0, 4
		la $a0, result
		syscall
		
		
		
		li $s2, 10
		div $s0, $s2
		mfhi $t0
		mflo $t1
		div $s1, $s2
		mfhi $t2
		mflo $t3
		
		li $a0, 0
		
		bne $t0, $t2, digitone
		j anothercheck
		digitone:
			addi $a0, $a0, 1
		
		anothercheck:
			bne $t1, $t3, digittwo
			j main_exit
			digittwo:
				addi $a0, $a0, 1
		main_exit:
			li $v0, 1
			syscall
			li $v0, 10
			syscall
			
		error_exit:
			li $v0, 4
			la $a0, err
			syscall
			li $v0, 10
			syscall
		