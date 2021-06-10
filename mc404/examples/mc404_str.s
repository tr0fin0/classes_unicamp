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

# char *strcpy(char *destination, const char *source)
strcpy:
    add t0, a0, zero # t0 = *destination

    loop:
        lbu t1, 0(a1)       #
        sbu t1, 0(a0)       # a0 = a1
        addi a0, a0, 1      # a0++
        addi a1, a1, 1      # a1++
        bne t1, zero, loop # if schar != \0 then end

    add a0, t0, zero # a0 = *destination

ret

# int strcmp(const char *str1, const char *str2)
strcmp:
    addi a0, zero, 1 # a0 = 1, str1 == str2

    loop:
        lbu t0, 0(a0)       # t0 = str1[i]
        lbu t1, 0(a1)       # t1 = str2[i]
        addi a0, a0, 1      # str1++
        addi a1, a1, 1      # str2++
        bne t0, t1, end    # if str1[i] != str2[i] then end
        bne t0, zero, loop # if str1[i] != \0      then loop

    end:
        addi a0, zero, 0 # a0 = 0, str1 != str2

ret