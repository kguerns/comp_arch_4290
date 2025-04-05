#       ECE4290-6290 Lab 3: remove spaces

        .data
        .align 2
        # allocating space for both strings
str:    .space  128
res:    .space  128

        .globl  main

        .text
main:   

        # read a string into str
        # use pseudoinstruction la to load address into register
        la      a0, str
        li      a1, 100
        li      a7, 8
        ecall

        # a0 is the address of str
        # a1 is the address of res
        la      a1, res

	# Step 2: remove spaces in 'str'
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
	
	
	# Step 3: Print string without the spaces
	li 	a7, 4
	add	a0, a1, zero
	ecall
               
        #_TMPL_ CUT    
