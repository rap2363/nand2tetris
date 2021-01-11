// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// R0 * R1 means we can sum up R0 + R0 ... + R0 R1 times to obtain a result.

  @i
  M=0 // i=0
  @R2
  M=0 // R2=0

(LOOP)
  @i
  D=M

  @R0
  D=D-M // D = i - R0

  @END
  D;JEQ
  // Jump when this value is 0

  @R1
  D=M // D=R1

  @R2
  M=D+M // Add R1 to the current value in R2

  @i
  M=M+1 // Increment i

  @LOOP
  0;JMP // Back to the beginning of the loop

(END)
  @END
  0;JMP // Infinite loop
