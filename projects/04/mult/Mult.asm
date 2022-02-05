// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

    @R0
    D=M
    @A
    M=D

    @B
    M=0

(LOOP)
    @A
    D=M-1
    @SAVE
    D;JLT
    @A
    M=D

    @R1
    D=M
    @B
    M=M+D

    @LOOP
    0;JMP

(SAVE)
    @B
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP
