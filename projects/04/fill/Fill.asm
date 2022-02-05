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


// press once - black
// press twise - white
// press third time - black
// etc ..
//
//    @COLOR
//    M=0
//
//(WAIT)
//    @KBD
//    D=M
//    @WAIT
//    D;JEQ
//
//    @COLOR
//    M=M+1
//    D=M
//    @SET-1
//    D;JGT
//
// (SET0)
//    @FILL
//    0;JMP
//
//(SET-1)
//    @COLOR
//    M=-1



// press - black
// unpress - white
////////////
(WAIT)
    @KBD
    D=M
    @FILL-WHITE
    D;JEQ

// (FILL-BLACK)
    @COLOR
    M=-1
    @FILL
    0;JMP

(FILL-WHITE)
    @COLOR
    M=0
    @FILL
    0;JMP


////////////
(FILL)
    @SCREEN
    D=A
    @POINTER
    M=D

(LOOP)
    @POINTER
    D=M
    @KBD
    D=A-D
    @WAIT
    D;JEQ

    @COLOR
    D=M
    @POINTER
    A=M
    M=D

    @POINTER
    M=M+1

    @LOOP
    0;JMP
