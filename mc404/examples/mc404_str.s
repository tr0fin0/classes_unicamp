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

strcpy:
    