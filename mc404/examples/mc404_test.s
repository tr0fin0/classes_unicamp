SomaVetor:
    # inicialize

    # save inicial pointers
    add s0, zero, a0 # s0 = *A[j]
    add s1, zero, a1 # s1 = *B[j]
    add s2, zero, a2 # s2 = *C[j]
    # save vectors size
    add s3, zero, a3 # s3 =  n

    # vector values registers
    add t0, zero, zero # t0 = A[j]
    add t1, zero, zero # t1 = B[j]
    add t2, zero, zero # t2 = C[j]
    # size counter
    add t3, zero, zero # i = 0

    loop:
        lw t1, 0(s1) # load B[j] value
        lw t2, 0(s2) # load C[j] value

        add t0, t1, t2 # store total value
        sw  t0, 0(s0)  # A[j] = B[j] + C[j]

        addi s0, s0, 4 # *A[j] -> A[j+1]
        addi s1, s1, 4 # *B[j] -> B[j+1]
        addi s2, s2, 4 # *C[j] -> C[j+1]

        addi t3, t3, 1 # i = i + 1

        blt t3, s3, loop # if i < n then loop

    jr ra # return

main:
    # declare values
    addi s0, zero, 1;
    addi s1, zero, 2;
    addi s2, zero, 3;
    addi s3, zero, 4;
    addi s4, zero, 5;

    # declare stack and store values
    addi sp, sp, -20;
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)

    # declare a2 = *c
    addi a2, sp, 0

    # declare stack and store values
    addi sp, sp, -20;
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)

    # declare a1 = *c
    addi a1, sp, 0
    addi a0, sp, -20
    addi a3, zero, 5; # a3 = zero + 5

    jal SomaVetor

    # remove stack and retrive values
    lw s4, 16(sp)
    lw s3, 12(sp)
    lw s2, 8(sp)
    lw s1, 4(sp)
    lw s0, 0(sp)
    addi sp, sp, 40; # sp = sp + 40

    jr ra