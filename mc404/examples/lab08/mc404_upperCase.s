# ---------
# Maiuscula
# ---------
# 
# char *Maiuscula(char *s)
#   char *s, pointer to string
# 
# receives a string ended in \0
# and return the same string with
# all it is letters upper case

Maiuscula:
    addi t0, a0, 0     # save *string
    addi t2, zero,  97 #a in ASCII
    addi t3, zero, 122 #z in ASCII

    loop:
        lbu t1, 0(a0)     #    char = string[i]
        beq t1, zero, end # if char == \0 then end

        addi a0, a0, 4    # a0++

        blt t1, t2, loop  # if char  a then loop
        bgt t1, t3, loop  # if char  z then loop

        lbu  t1,  -4(a0)  #      char = string[i]
        addi t1, t1, -32  #       "A" = "a" - 32
        sb   t1,  -4(a0)  # string[i] = CHAR

        j loop

    end:
        addi a0, t0, 0 # return *string
        jr ra