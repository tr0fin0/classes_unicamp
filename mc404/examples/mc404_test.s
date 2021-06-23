.section .data
    .vector:
        .word 0x61605E5C # 00 6E 64 62 5C 5E 60 61 61 60 5E 5C
        .word 0x5C5E6061
        .word 0x006E6462
        .word 0x00000000 # result 0

        .word 0x605E5C62 # 00 62 5C 5E 60 61 6E 61 60 5E 5C 62
        .word 0x60616E61
        .word 0x00625C5E
        .word 0x00000001 # result 1

        .word 0x61605E5C # 00 00 5C 5E 60 61 6E 6E 61 60 5E 5C
        .word 0x60616E6E
        .word 0x00005C5E
        .word 0x00000001 # result 1

        .word 0x605E5C62 # 00 62 5C 5E 60 61 6E 60 60 5E 5C 62
        .word 0x60616E60
        .word 0x00625C5E
        .word 0x00000000 # result 0

        .word 0x605E5C62 # 62 5C 5E 60 61 6E 5E 61 60 5E 5C 62
        .word 0x616E5E61
        .word 0x625C5E60
        .word 0x00000000 # result 0

        .word 0x00000000 # 00 00 00 00 00 00 00 00 00 00 00 00
        .word 0x00000000
        .word 0x00000000
        .word 0x00000001 # result 1

        .word 0x20202064 # 64 20 20 20 20 20 20 20 20 20 20 64
        .word 0x20202020
        .word 0x00006420
        .word 0x00000001 # result 1

        .word 0x44434241 # 41 42 43 44 45 45 44 43 42 41 00 00
        .word 0x43444545
        .word 0x00004142
        .word 0x00000001 # result 1

        .word 0x44434241 # 41 42 43 44 45 46 45 44 43 42 41 00
        .word 0x44454645
        .word 0x00414243
        .word 0x00000001 # result 1

        .word 0x64636261 # 41 42 43 44 45 65 64 63 62 61 00 00
        .word 0x43444565
        .word 0x00004142
        .word 0x00000001 # result 0



.section .text
# insert function here

    main:

        addi sp, sp, -4             # allocating space in stack
        sw   ra, 0(sp)              # saving ra address

        lui  s2, %hi(.vector)       #     save top    20 bits
        addi s2, s2, %lo(.vector)   # *s  save bottom 12 bits

        addi s3, zero, 0            # i = 0   counter
        addi s4, zero, 10           # n = 10  number of tests

        tests:

            addi a0, s2, 0          # save *s  function variable
            lw s1, 12(s2)           # save r   expected result

            addi sp, sp, -16        # allocating space in stack
            sw   s1,  0(sp)         # save  r
            sw   s2,  4(sp)         # save *s
            sw   s3,  8(sp)         # save  i
            sw   s4, 12(sp)         # save  n

            call Palindrome         # call of function to test

            lw   s4, 12(sp)         # retriev  n
            lw   s3,  8(sp)         # retriev  i
            lw   s2,  4(sp)         # retriev *s
            lw   s1,  0(sp)         # retriev  r
            addi sp, sp, 16         # desallocating space in stack

            addi t0, zero, 1        # syscall: print int
            addi a0, a0, 0          # caracter to print
            ecall

            bne a0, s1, terminate   # if a0 != r then terminate  test fail
            addi s2, s2, 16         # next test
            addi s3, s3, 1          # i++

            beq s3, s4, terminate   # if  i == n then terminate  test end
            j tests

        terminate:

            lw   ra, 0(sp)          # retrieving ra address
            addi sp, sp,4           # desallocatin space in stack
            jr ra