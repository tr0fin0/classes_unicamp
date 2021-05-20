    main:
        addi t0, zero, 9
        addi t1, zero, 0
        addi t2, zero, 5

        bne t0, t2, else
        addi t1, t1, 7
        j fim

    else:
        addi t1, t1, 15

    fim:
        jr ra