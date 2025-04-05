#       ECE4290_6290 Lab 1

        .globl  main

        .text
main:   
        
        # read two positive integers from the console and 
        # save them in s1 and s2 
        # compute the GCD of the two numbers with Euclidean algorithm 
        #     while a != b:
        #         if a > b:
        #             a = a - b
        #         else:
        #             b = b - a
        # print the GCD

        # GCD examples:
        #     gcd(11, 121) = 11
        #     gcd(24, 60) = 12
        #     gcd(192, 270) = 6
        #     gcd(14, 97) = 1

        # use system call 5 to read integers
        addi    a7, x0, 5       # service number 5, readInt from console
        ecall
        addi    s1, a0, 0       # a in s1

        # using pseudoinstructions
        li      a7, 5		# service number 5, readInt from console
        ecall
        mv      s2, a0          # b in s2

        # TODO
        # Add you code here below
        # compute GCD(a, b) and print it
        
        # Find GCD using Euclidean Algorithm by substraction
        Loop:
        	beq s1, s2, Exit	# if a = b goto Exit
        	
	        	ble s1, s2, Else	# if a <= b goto Else
	        	sub s1, s1, s2		# a = a - b
	        	beq x0, x0, EndIf	# goto EndIf
        	Else:
        		sub s2, s2, s1		# b = b - a
        	EndIf:
        	
        	beq x0, x0, Loop	# goto Loop
        Exit:
        
        # Print GCD
        addi a7, x0, 1		# service number 1, printInt to console
        add a0, x0, s1		# a in a0
        ecall
        
        #_TMPL_ CUT


