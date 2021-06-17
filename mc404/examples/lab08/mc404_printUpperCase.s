# ----------------
# ImprimeMaiuscula
# ----------------
# 
# void *ImprimeMaiuscula(char *s)
#   char *s, pointer to string
# 
# receives a string ended in \0 
# and print the same string with 
# all it is letters upper case
# 
# assuming that the Maiuscula 
# is implemented
# 
#     .TEXT:
#         .word 0x61605E5C
#         .word 0x796E6462
#         .word 0x00007B7A

ImprimeMaiuscula:
    addi sp, sp, -4
    sw   ra, 0(sp)

    call Maiuscula

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
        lw   ra, 0(sp)
        addi sp, sp,4
        jr ra