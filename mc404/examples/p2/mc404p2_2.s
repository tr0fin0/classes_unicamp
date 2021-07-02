.section .data
palavra:
    .word 0x00060004
    .word 0x00060004
    .word 0x00020002

.section .text
# int SomaVetor(short int *v, int N)
        # simulator has problems but the logic works
        # the comparation order has a problem so this correct even numbers
        # so when it loads a halfword it all do value and 0xffff0000
        # even and negative numbers do not work well with the simulator
SomaVetor:
    addi t0, a0, 0              # t0 = *v[i] pointer
    addi t1, a1, 0              # t1 = n     number of elements
    addi t2, zero, 0            # t2 = s     sum of numbers
    ble  t1, zero, end          # if t1 == zero then end

    loop:
        lh  t3, 0(t0)           # t3 = v[i]

        add  t2, t2, t3         # s += v[i]

        addi t0, t0,  2         # *v[i] = *v[i+1]
        addi t1, t1, -1         # i--
        beq t1, zero, end       # if n == zero then end
        j loop

    end:
        addi a0, t2, 0          # a0 = s
        jr ra



main:
    addi sp, sp, -4             # allocating space in stack
    sw   ra, 0(sp)              # saving ra address

    lui  a0, %hi(palavra)
    addi a0, a0, %lo(palavra)
    addi a1, zero, 6

    call SomaVetor

    lw   ra, 0(sp)              # retrieving ra address
    addi sp, sp,4               # desallocatin space in stack
    jr ra