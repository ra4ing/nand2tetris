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

    @SCREEN
    D=A
    @address
    M=D         // address = 16384
    @state
    M=0
    @lastState
    M=0

(LOOP)

    @KBD
    D=M
    @BLACK
    D;JNE       // if kbd != 0: black

    @state
    M=0         // else: white
    @WHITE
    0;JMP
(BLACK)
    @state
    M=-1
(WHITE)
    @state      // judge state == lastState
    D=M
    @lastState
    D=M-D
    @LOOP
    D;JEQ       //if state == 0: jmp to LOOP


    @address
    D=M
    @i
    M=D         // i = address

(SET_LOOP)
    
    @state      // set screen
    D=M
    @i
    A=M
    M=D

    @state      // set lastState
    D=M
    @lastState
    M=D

    @i
    M=M+1        // i += 1

    @i
    D=M
    @KBD
    D=A-D
    @SET_LOOP
    D;JNE       // keep set

    @LOOP       // set over
    0;JMP
