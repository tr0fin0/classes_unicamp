Minuscula:
    addi t2, zero, 65           # A in ASCII
    addi t3, zero, 90           # Z in ASCII
    addi t4, zero, 32           # Z in ASCII

    start:
        blt a0, t2,   endStart  # if char  A then loop
        bgt a0, t3,   endStart  # if char  Z then loop
        add a0, a0, t4          #       "a" = "A" + 32

    endStart:
        jr ra

# TrazParaFrenteMinuscula(char *s)
TrazParaFrenteMinuscula:

    addi s0, a0, 0              # t0 = *string
    addi s1, a0, 0              # t1 = *string


    loop:
        lbu a0, 0(s1)           #    char = string[i]
        beq a0, zero, endLoop   # if char == \0 then end

        addi sp, sp, -12        # allocating space in stack
        sw   ra, 0(sp)          # saving ra address
        sw   s0, 4(sp)          # 
        sw   s1, 8(sp)          # 

        call Minuscula

        lw   s1, 8(sp)          # 
        lw   s0, 4(sp)          # 
        lw   ra, 0(sp)          # retrieving ra address
        addi sp, sp, 12         # desallocatin space in stack
        
        sb  a0, 0(s1)           # 
        addi s1, s1, 1          # a0++

        j loop


    endLoop:
        addi a0, s0, 0          # t0 = *string


    addi t0, a0, 0              # t0 = *string
    addi t1, a0, 0              # t1 = *string
    addi t2, a0, 0              # t2 = *string
    addi t3, zero, 1            # t3 = ws   char size
    addi t5, zero, 0            # t4 = n    string size


    stack:
        lbu t4, 0(t0)           #    char = string[i]
        beq t4, zero, save      # if char == \0 then save

        add  t0, t0, t3         # i++
        addi t5, t5,  1         # n++

        sub sp, sp, t3          # allocating space in stack
        sb  t4, 0(sp)           #
        j stack


    save:
        beq t0, t1, endSave     # if t0 == t1 then endSave

        lbu t4, 0(sp)           #
        add sp, sp, t3          # allocating space in stack

        sb  t4, 0(a0)           # saving ra address

        add  a0, a0, t3         # i++
        sub  t0, t0, t3         # i--

        j save


    endSave:
        addi a0, t1, 0          # t1 = *string
        jr ra