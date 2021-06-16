.section .data
    string:
        .word 65
        .word 100
        .word 92 
        .word 94 
        .word 96 
        .word 97 
        .word 98 
        .word 110
        .word 121
        .word 123
        .word 122
        .word 0

.section .text
    Maiuscula:
        addi t0, a0, 0     # save *string
        addi t2, zero,  97 #a in ASCII
        addi t3, zero, 122 #z in ASCII

        loop1:
            lbu t1, 0(a0)     #    char = string[i]
            beq t1, zero, end1 # if char == \0 then end

            addi a0, a0, 4    # a0++

            blt t1, t2, loop1  # if char  a then loop
            bgt t1, t3, loop1  # if char  z then loop

            lbu  t1,  -4(a0)  #      char = string[i]
            addi t1, t1, -32  #       "A" = "a" - 32
            sb   t1,  -4(a0)  # string[i] = CHAR

            j loop1

        end1:
            addi a0, t0, 0 # return *string
            jr ra

    ImprimeMaiuscula:
        call Maiuscula
        
        addi t1, a0, 0     # *string

        loop:
            lbu t2, 0(t1)      #    char = string[i]
            beq t2, zero, end  # if char == \0 then end
            
            addi t1, t1, 4     # a0++
            
            addi t0, zero, 2   # syscall: print caracter
            addi a0, t2, 0     # caracter to print
            ecall

            j loop

        end:
            jr ra

    main:
        # declare a0 = *string
        lui  a0,     %hi(string)
        addi a0, a0, %lo(string)

        call ImprimeMaiuscula

        jr ra