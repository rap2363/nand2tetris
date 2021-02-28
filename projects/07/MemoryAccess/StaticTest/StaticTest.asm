@111 // D=111
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@333 // D=333
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@888 // D=888
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@SP // StaticTest.vm.8=*SP
A=M
D=M
@StaticTest.vm.8
M=D
@SP // SP--
M=M-1
@SP // StaticTest.vm.3=*SP
A=M
D=M
@StaticTest.vm.3
M=D
@SP // SP--
M=M-1
@SP // StaticTest.vm.1=*SP
A=M
D=M
@StaticTest.vm.1
M=D
@StaticTest.vm.3 // *SP=StaticTest.vm.3
D=M
@SP
A=M
M=D
@SP // SP++
M=M+1
@StaticTest.vm.1 // *SP=StaticTest.vm.1
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
@StaticTest.vm.8 // *SP=StaticTest.vm.8
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
