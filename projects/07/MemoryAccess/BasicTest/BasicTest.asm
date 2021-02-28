@10 // D=10
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@0 // *(LCL+0)=*SP
D=A
@LCL
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=LCL+0
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@21 // D=21
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@22 // D=22
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@2 // *(ARG+2)=*SP
D=A
@ARG
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=ARG+2
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@SP // SP--
M=M-1
@1 // *(ARG+1)=*SP
D=A
@ARG
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=ARG+1
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@36 // D=36
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@6 // *(THIS+6)=*SP
D=A
@THIS
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=THIS+6
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@42 // D=42
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@45 // D=45
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@5 // *(THAT+5)=*SP
D=A
@THAT
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=THAT+5
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@SP // SP--
M=M-1
@2 // *(THAT+2)=*SP
D=A
@THAT
A=M
A=D+A
D=A
@offsetaddr // offsetaddr=THAT+2
M=D
@SP
A=M
D=M
@offsetaddr
A=M
M=D
@510 // D=510
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
@11 // *index=D
M=D
@0 // *SP=*(LCL+0)
D=A
@LCL
A=M
A=D+A
D=M
@SP
A=M
M=D
@SP // SP++
M=M+1
@5 // *SP=*(THAT+5)
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
@1 // *SP=*(ARG+1)
D=A
@ARG
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
@6 // *SP=*(THIS+6)
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
@6 // *SP=*(THIS+6)
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
@11 // D=*index
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
(PROGRAM_COMPLETE)
@PROGRAM_COMPLETE
0;JMP
