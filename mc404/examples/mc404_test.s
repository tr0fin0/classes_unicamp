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
        .word 0x60616E6E #
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

.section .text
    Maiuscula:
        addi t0, a0, 0          # save *string
        addi t2, zero,  97      # a in ASCII
        addi t3, zero, 122      # z in ASCII

        loop:
            lbu t1, 0(a0)       #    char = string[i]
            beq t1, zero, end   # if char == \0 then end

            addi a0, a0, 1      # a0++

            blt t1, t2, loop    # if char  a then loop
            bgt t1, t3, loop    # if char  z then loop

            lbu  t1,  -1(a0)    #      char = string[i]
            addi t1, t1, -32    #       "A" = "a" - 32
            sb   t1,  -1(a0)    # string[i] = CHAR

            j loop

        end:
            addi a0, t0, 0      # return *string
            jr ra

    Palindrome:
        addi sp, sp, -4
        sw   ra, 0(sp)

        call Maiuscula

        addi t0, a0, 0          # *s[0]

        loop0:
            lbu t1, 0(a0)       #    char = s[i]
            beq t1, zero, end0  # if char == \0 then end0

            addi a0, a0, 1      # a0++
            j loop0

        end0:
            addi t1, a0, -1     # *s[n-1]

        addi a0, zero, 1;       # a0 = 1

        loop1:
            lbu t2, 0(t0)       # s[i]
            lbu t3, 0(t1)       # s[n-i-1]
            beq t2, zero, end2  # if s[i] == zero then end2

            addi t0, t0,  1     # t0++
            addi t1, t1, -1     # t1--

            bne t2, t3, end1;   # if s[i] != s[n-i-1] then end1
            j loop1

        end1:
            addi a0, zero, 0;   # a0 = 0

        end2:
            lw   ra, 0(sp)
            addi sp, sp,4
            jr ra

    main:

        addi sp, sp, -4             # allocating space in stack
        sw   ra, 0(sp)              # saving ra address

        lui  s2, %hi(.vector)       #     save top    20 bits
        addi s2, s2, %lo(.vector)   # *s  save bottom 12 bits

        addi s3, zero, 0            # i = 0   counter
        addi s4, zero, 7            # n = 7   number of tests

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