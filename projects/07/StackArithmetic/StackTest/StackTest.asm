@17 // D=17
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@17 // D=17
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
@x // x==y
D=M
@y
D=D-M
@EQUAL_RESULT_2
D;JEQ // Jump to the equality branch
D=0
@DONE_2
0;JMP // Results are not equal, jump to the end
(EQUAL_RESULT_2)
D=-1
(DONE_2)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@17 // D=17
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@16 // D=16
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
@x // x==y
D=M
@y
D=D-M
@EQUAL_RESULT_9
D;JEQ // Jump to the equality branch
D=0
@DONE_9
0;JMP // Results are not equal, jump to the end
(EQUAL_RESULT_9)
D=-1
(DONE_9)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@16 // D=16
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@17 // D=17
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
@x // x==y
D=M
@y
D=D-M
@EQUAL_RESULT_16
D;JEQ // Jump to the equality branch
D=0
@DONE_16
0;JMP // Results are not equal, jump to the end
(EQUAL_RESULT_16)
D=-1
(DONE_16)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@892 // D=892
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@891 // D=891
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
@x // x<y
D=M
@y
D=D-M
@LT_RESULT_25
D;JLT // Jump to the less-than branch
D=0
@DONE_25
0;JMP // x>=y, jump to the end
(LT_RESULT_25)
D=-1
(DONE_25)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@891 // D=891
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@892 // D=892
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
@x // x<y
D=M
@y
D=D-M
@LT_RESULT_32
D;JLT // Jump to the less-than branch
D=0
@DONE_32
0;JMP // x>=y, jump to the end
(LT_RESULT_32)
D=-1
(DONE_32)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@891 // D=891
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@891 // D=891
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
@x // x<y
D=M
@y
D=D-M
@LT_RESULT_39
D;JLT // Jump to the less-than branch
D=0
@DONE_39
0;JMP // x>=y, jump to the end
(LT_RESULT_39)
D=-1
(DONE_39)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@32767 // D=32767
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@32766 // D=32766
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
@x // x>y
D=M
@y
D=D-M
@GT_RESULT_45
D;JGT // Jump to the greater-than branch
D=0
@DONE_45
0;JMP // x<=y, jump to the end
(GT_RESULT_45)
D=-1
(DONE_45)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@32766 // D=32766
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@32767 // D=32767
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
@x // x>y
D=M
@y
D=D-M
@GT_RESULT_52
D;JGT // Jump to the greater-than branch
D=0
@DONE_52
0;JMP // x<=y, jump to the end
(GT_RESULT_52)
D=-1
(DONE_52)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@32766 // D=32766
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@32766 // D=32766
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
@x // x>y
D=M
@y
D=D-M
@GT_RESULT_59
D;JGT // Jump to the greater-than branch
D=0
@DONE_59
0;JMP // x<=y, jump to the end
(GT_RESULT_59)
D=-1
(DONE_59)
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@57 // D=57
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@31 // D=31
D=A
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@53 // D=53
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
@112 // D=112
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
@SP // SP--
M=M-1
@SP // *SP=-(*SP)
A=M
M=-M
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
@x // x&y
D=M
@result
M=D
@y
D=M
@result
D=M&D
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@82 // D=82
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
@x // x|y
D=M
@result
M=D
@y
D=M
@result
D=M|D
@SP // *SP=D
A=M
M=D
@SP // SP++
M=M+1
@SP // SP--
M=M-1
@SP // *SP=!(*SP)
A=M
M=!M
@SP // SP++
M=M+1
(PROGRAM_COMPLETE)
@PROGRAM_COMPLETE
0;JMP
