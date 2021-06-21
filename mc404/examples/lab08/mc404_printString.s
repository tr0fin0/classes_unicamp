# -------------
# ImprimeString
# -------------
# 
# void *ImprimeString(char *s)
#   char *s, pointer to string
# 
# receives a string ended in \0 
# and print the string

ImprimeString:
    addi t1, a0, 0         # *string

    loop:
        lbu t2, 0(t1)      #    char = string[i]
        beq t2, zero, end  # if char == \0 then end

        addi t1, t1, 1     # a0++

        addi t0, zero, 2   # syscall: print caracter
        addi a0, t2, 0     # caracter to print
        ecall

        j loop

    end:
        jr ra