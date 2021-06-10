# int strlen(const char *str)
strlen:
    addi t0, zero, 0 # i lenght of string

    loop:
        lbu t1, 0(a0)     # char = string[i]
        beq t1, zero, end # if char == \0 then end
        addi t0, t0, 1    # i++
        addi a0, a0, 1    # a0++
        j loop

    end:
        addi a0, t0, 0 # a0 = i
ret

# char *strcpy( char *destination, const char *source)
strcpy:
    add t0, a0, zero # t0 = *destination

    loop:
        lbu t1, 0(a1)       #
        sbu t1, 0(a0)       # a0 = a1
        addi a0, a0, 1      # a0++
        addi a1, a1, 1      # a1++
        bne t1, zero, loop; # if schar == \0 then end

    add a0, t0, zero # a0 = *destination

ret