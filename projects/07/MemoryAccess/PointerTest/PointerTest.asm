@3030 // D=3030
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@SP // D=*SP
A=M
D=M
@3 // *index=D
M=D
@3040 // D=3040
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@SP // D=*SP
A=M
D=M
@4 // *index=D
M=D
@32 // D=32
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@2 // *(THIS+2)=*SP
D=A
@THIS
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=THIS+2
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@46 // D=46
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@6 // *(THAT+6)=*SP
D=A
@THAT
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=THAT+6
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@3 // D=*index
D=M
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@4 // D=*index
D=M
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
@2 // *SP=*(THIS+2)
D=A
@THIS
A=M
A=D+A
D=M
@SP
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
@x // x-y
D=M
@result
M=D
@y
D=M
@result
D=M-D
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@6 // *SP=*(THAT+6)
D=A
@THAT
A=M
A=D+A
D=M
@SP
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
