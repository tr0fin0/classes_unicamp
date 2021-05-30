main:
    addi s0, zero, 3
    addi s1, zero, 4
    addi s2, zero, 7

    add s3, s0, s1
    sub s3, s3, s2
    bge zero, s3, else

    add s3, s1, s2
    sub s3, s3, s0
    bge zero, s3, else

    add s3, s2, s0
    sub s3, s3, s2
    bge zero, s3, else

    sub a0, a0, a0
    addi a0, zero, 1
    j fim

else:
    sub a0, a0, a0
    add a0, zero, zero

fim:
    jr ra