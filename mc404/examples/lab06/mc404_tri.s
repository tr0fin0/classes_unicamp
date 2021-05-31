#  --------------------------
#  posible triangule code
#  --------------------------
#  s0 side A of the triangule
#  s1 side B of the triangule
#  s2 side C of the triangule

## if a0 == 0 impossible triangule
#        == 1   possible triangule

#  for testing, uncomment and put the following 
#  lines on the main code:
#     addi s0, zero, 3
#     addi s1, zero, 4
#     addi s2, zero, 6
main:

    add t0, s0, s1     # t0 = s0 + s1
    sub t0, t0, s2     # t0 = s0 + s1 - s2
    bge zero, t0, else # if t0 >= 0 then else

    add t0, s1, s2     # t0 = s1 + s2
    sub t0, t0, s0     # t0 = s1 + s2 - s0
    bge zero, t0, else # if t0 >= 0 then else

    add t0, s2, s0     # t0 = s2 + s0
    sub t0, t0, s2     # t0 = s2 + s0 - s1
    bge zero, t0, else # if t0 >= 0 then else

    # passed all restrictions
    addi a0, zero, 1 # a0 = 1
    j end            # go to end

else:
    add a0, zero, zero # a0 = 0

end:
    jr ra