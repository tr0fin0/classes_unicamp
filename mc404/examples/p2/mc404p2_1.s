.section .data
NUMEROS:
    .word 9
    .word 4
    .word 15
    .word 6
    .word 3


.section .text
elefante:
    lui  t0, %hi(NUMEROS)
    addi t0, t0, %lo(NUMEROS)

    addi t1, zero, 5            #   i = 5
    addi t2, zero, 0            # sum = 0

    abacate:
        lw   t3, 0(t0)          # t3 = v[i]
        andi t4, t3, 1          # t4 = 1, if a1 is even (a1[LSB])
                                #    = 0, if a1 is odd  (a1[LSB])
        beq  t4, zero, uva      # if v[i] is odd  do not sum
        add  t2, t2, t3         # if v[i] is even do     sum

    uva:
        addi t0, t0, 4          # *v[i] = *v[i+1]
        addi t1, t1, -1         # i--
        bne  t1, zero, abacate  # if i != 0 goto abacate

        add a0, zero, t2        # a0: sum of all even numbers
        ret                     # return of function



main:
    addi sp, sp, -4             # allocating space in stack
    sw   ra, 0(sp)              # saving ra address

    call elefante

    lw   ra, 0(sp)              # retrieving ra address
    addi sp, sp,4               # desallocatin space in stack
    jr ra