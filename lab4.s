#       ECE4290-6290 Lab 4: Remove spaces

        .data

        # allocating space for str
str:    .space  128

        .globl  main

        .text
main:   
        # read a string into str
        # use pseudoinstruction la to load address into register
        la      a0, str

main_loop:
        # read a string
        addi    a1, x0, 100
        addi    a7, x0, 8
        ecall

        # check if the line is empty (has only the newline) 
        lb      t0, 0(a0)
        addi    t1, x0, '\n'
        beq     t0, t1, exit

	# a0 is already set. does not change during ecall
	jal	ra, print_ns

        # the address of str should be in a0 
        addi 	a7, x0, 4	# print str
        ecall
        
        beq     x0, x0, main_loop
 
exit:   addi    a7, x0, 10
        ecall

# DO NOT change code above this line

# function 
print_ns:
        # save registers
        addi 	sp, sp, -8
        sw	a0, 4(sp)
        sw	ra, 0(sp)
        
        # allocate a byte array of 128 bytes on stack to save result  
        addi 	sp, sp, -128
        add 	a1, sp, zero	# a1 = addr of res[0]
        
        # call remove_spaces
        jal 	ra, remove_spaces
        
        # print res
       	li 	a7, 4
	add	a0, a1, zero
	ecall
	
        # restore registers
        addi	sp, sp	128
        lw	ra, 0(sp)
        lw 	a0, 4(sp)
        addi	sp, sp, 8
        
        # return
        jalr x0, 0(ra)
        
        #_TMPL_ CUT    


# function remove_spaces
remove_spaces:

	# remove spaces from the string
	add	t0, a0, zero	# i = addr of str[0]
	add	t1, a1, zero	# j = addr of res[0]
	li	t2, 32		# t2 = 32
Loop:	
	lb	t3, 0(t0)	# t3 = value of str[i]
	add	t4, t3, zero	# c = str[i]
	beq 	t4, t2, Skip	# if c=32 goto skip
	sb 	t4, 0(t1)	# res[j] = c
	addi	t1, t1, 1	# j += 1
Skip:	addi	t0, t0, 1	# i += 1
Test:	bne	t4, zero, Loop	# if (c != 0) goto Loop

	# return
	jalr	x0, 0(ra)

        #_TMPL_ CUT    

