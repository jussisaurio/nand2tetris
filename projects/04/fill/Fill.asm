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

// Put your code here.        

@draw // init draw color as black
M=0
@color // init screen color as black
M=0
@8192 // number of bytes to iterate through
D=A
@max
M=D

(LOOP) // main loop where check key pressed
@offset
M=0
@KBD // load index of keyboard map into A
D=M // load RAM[KEYBOARD] into D. 0 is black, anything else is white
@SETBLACK
D; JEQ

(SETWHITE)
@draw
M=-1
@CHECK
0; JMP

(SETBLACK)
@draw
M=0

(CHECK)
@draw
D=M
@color
D=D-M
@LOOP // if draw color is same as screen color, no-op
D; JEQ

@draw
D=M
@color
M=D

@draw
D=M
@PAINTBLACKLOOP
D; JEQ

(PAINTWHITELOOP)
@offset
D=M
@SCREEN
A=A+D
M=-1
@offset
M=M+1
D=M
@max
D=M-D
@LOOP
D; JEQ
@PAINTWHITELOOP
0; JMP

(PAINTBLACKLOOP)
@offset
D=M
@SCREEN
A=A+D
M=0
@offset
M=M+1
D=M
@max
D=M-D
@LOOP
D; JEQ
@PAINTBLACKLOOP
0; JMP
