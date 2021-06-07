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

MenorVetor:
    add s0, zero, a0   # s0 = *v, save pointer
    add t0, zero, zero # i  = 0,  start counter
    lw  t1, 0(s0)      # min = 0, save first value

    loop:
        lw  a0, 0(s0)    # a0 = v[j]
        bge a0, t1, pass # if v[j] ge min then pass

        add t1, zero, a0 # min = v[j]

    pass:
        addi s0, s0, 4   # j++, advance in stack
        addi t0, t0, 1   # i++, advance in counter
        blt t0, a1, loop # if i lt n then loop

    add a0, t1, zero # save value
    jr ra            # return