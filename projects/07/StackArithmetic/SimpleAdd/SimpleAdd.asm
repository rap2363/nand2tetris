@7 // D=7
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@8 // D=8
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@SP // y=*SP
A=M
D=M
@y
M=D
@SP // SP--
M=M-1
@SP // x=*SP
A=M
D=M
@x
M=D
@x // x+y
D=M
@result
M=D
@y
D=M
@result
D=M+D
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
(PROGRAM_COMPLETE)
@PROGRAM_COMPLETE
0;JMP
