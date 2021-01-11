// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

  @8192
  D=A
  @numrows
  M=D // numrows=8192 (the number of rows in the screen)

(START)
  @offset
  M=0 // Set the offset to 0
  @KBD
  D=M
  @WHITE
  D;JEQ // If no key has been pressed, set the color value to white.
  @BLACK
  0;JMP // Otherwise we color everything black.

(WHITE)
  @color
  D=M
  M=0 // Set the color value to white
  D=D-M
  @START
  D;JEQ // Mini optimization, if the color value hasn't changed from the last time, we don't need to fill the screen.
  @SCREENFILL
  0;JMP

(BLACK)
  @color
  M=-1 // Set the color value to black
  D=D-M
  @START
  D;JEQ // Mini optimization, if the color value hasn't changed from the last time, we don't need to fill the screen.

(SCREENFILL)
  @offset
  D=M
  @SCREEN
  D=D+A // Offset the address
  @screenpointer
  M=D // Write the address to a pointer variable
  @color
  D=M
  @screenpointer
  A=M
  M=D // Write a value to the offset address

  @numrows
  D=M   // Set D to the numrows (so we can subtract)
  @offset
  M=M+1 // Increment the offset
  D=D-M
  @SCREENFILL
  D;JNE // Keep filling until we hit our limit

  @START
  0;JMP // Back to the start to loop.
