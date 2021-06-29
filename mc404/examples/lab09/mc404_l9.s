.section .text
# insert function here
    function:
        addi t0, zero, 4            # syscall: 4 read integer
        ecall

        addi t1, a0,    0           # t0 = n    number of strings
        addi t2, zero, 20           # t2 = s    size   of strings
        addi t3, zero,  0           # t3 = i    counter


        read:
            sub  sp, sp, t2         # allocating space in stack
            addi a0, sp,  0

            addi t0, zero, 6        # syscall: 6 read string
            add  a1, zero, t2       # syscall: a1 size of string = s
            ecall

            addi t3, t3, 1          # i++
            beq t3, t1, print       # if i == n then read
            j read


        print:
            addi a0, sp,  0         # str[n-i-1]
            add  sp, sp, t2         # desallocatin space in stack

            addi t0, zero, 3        # syscall: 3 print string
            add  a1, zero, t2       # syscall: a1 size of string = s
            ecall

            addi t0, zero, 2        # syscall: 2 print caracter
            addi a0, zero, 13       # caracter \n
            ecall

            addi t3, t3, -1         # i--
            beq  t3, zero, end      # if i == 0 then end
            j print

        end:
            jr ra



    main:
        addi sp, sp, -4             # allocating space in stack
        sw   ra, 0(sp)              # saving ra address

        call function               # call of function to test

        lw   ra, 0(sp)              # retrieving ra address
        addi sp, sp,  4             # desallocatin space in stack
        jr ra