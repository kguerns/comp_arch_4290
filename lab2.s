#       ECE 4290/6290 Lab 2

        .globl  main

        .text
main:   
        
        # read one integer from the console and 
        # print the number in binary 
 
        # use system call 5 to read integer
        addi    a7, x0, 5
        ecall
        addi    s1, a0, 0

        # use system call 35 to print a0 in binary
        # a0 has the integer we want to print
        addi    a7, x0, 35
        ecall
        
        # use system call 11 to print ascii character
        li	a0, '\n'
        addi	a7, x0, 11
        ecall
        
        # loop to print bits of s1
        add	t1, x0, s1	# t1 = s1
        addi	t2, x0, 0x000
        lui	t2, 0x80000	# set mask
loop:	
	and	t3, t1, t2	# apply mask
	bne	t3, x0, else	# if bits != 0 goto else
	li	a0, '0'
	beq 	x0, x0, endif
else:	li	a0, '1'
endif:	ecall			# print bit
	srli	t2, t2, 1	# shift mask right
test:	bne	t2, x0, loop
        
 	# use system call 11 to print ascii character
        li	a0, '\n'
        addi	a7, x0, 11
        ecall       
 
