# -----------------------
# smaller value in vector
# -----------------------
# 
# menorVetor(int *v, int n)
# int *v, vector with n int's
# int n,  size of vector's
#  the first argument is a pointer to
#  where the array starts in the memory
#  to compair you need the go throw the
#  array getting every value and comparing
#  with the rest saving the smaller

# # declare values
# addi s0, zero, 8; # s0 = zero + 1
# addi s1, zero, 11; # s1 = zero + 2
# addi s2, zero, 2; # s2 = zero + 3
# addi s3, zero, 9; # s3 = zero + 4
# addi s4, zero, 5; # s4 = zero + 5

# # declare a0 = *v and a1 = n
# addi a0, sp, 0
# addi a1, zero, 5

# # declare stack and store values
# addi sp, sp, -20; # sp = sp + -20
# sw s0, 0(sp)
# sw s1, 4(sp)
# sw s2, 8(sp)
# sw s3, 12(sp)
# sw s4, 16(sp)

# # remove stack and retrive values
# lw s4, 16(sp)
# lw s3, 12(sp)
# lw s2, 8(sp)
# lw s1, 4(sp)
# lw s0, 0(sp)
# addi sp, sp, 20; # sp = sp + 20

MenorVetor:
    # inicialize
    add s0, zero, a0   # s0 = *v, save pointer
    add t0, zero, zero # i  = 0,  start counter

    lw t1, 0(s0)       # min = 0, save first value

    loop:
        lw  a0, 0(s0)    # a0 = v[j]
        bge a0, t1, pass # if v[j] >= min then pass

        add t1, zero, a0 # min = v[j]

    pass:
        addi s0, s0, 4   # j++, advance in stack
        addi t0, t0, 1   # i++, advance in counter
        blt t0, a1, loop # if i < n then loop

    add a0, t1, zero # save value
    jr ra            # return