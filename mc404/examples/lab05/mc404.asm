// if R4 == 0 impossible triangule
//       == 1   possible triangule
@R4 //inicialize R4 as 0
M=0

//0 < A + B - C
@H
M=0  //H = 0
@R0
D=M  //REGD = RAM[R0]
@H
M=M+D //H = R0
@R1
D=M  //REGD = RAM[R1]
@H
M=M+D //H = R0 + R1
@R2
D=M  //REGD = RAM[R0]
@H
M=M-D  //H = R0 + R1 - R2

@H
D=M //REGD = RAM[H]
@END
D;JLE //if H <= 0 goto end

//0 < B + C - A
@H
M=0  //H = 0
@R1
D=M  //REGD = RAM[R0]
@H
M=M+D //H = R1
@R2
D=M  //REGD = RAM[R1]
@H
M=M+D //H = R1 + R2
@R0
D=M  //REGD = RAM[R0]
@H
M=M-D  //H = R1 + R2 - R0

@H
D=M //REGD = RAM[H]
@END
D;JLE //if H <= 0 goto end

//0 < C + A - B
@H
M=0  //H = 0
@R2
D=M  //REGD = RAM[R0]
@H
M=M+D //H = R2
@R0
D=M  //REGD = RAM[R1]
@H
M=M+D //H = R2 + R0
@R1
D=M  //REGD = RAM[R0]
@H
M=M-D  //H = R2 + R0 - R1

@H
D=M //REGD = RAM[H]
@END
D;JLE //if H <= 0 goto end

//pass all test
@R4
M=1

(END) //end label
@END
0;JMP