// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

    @2
    M=0     // R2 = 0
    @0
    D=M
    @i
    M=D     // i=R0
(LOOP)
    @i
    D=M     // D=i
    @END
    D;JLE    // if i-R0 >= 0: jmp END

    @i
    M=M-1   // else: i=i-1

    @1
    D=M     // D=R1
    @2
    M=D+M   // R2=R2+R1
    
    @LOOP
    0;JMP   // Repeat
(END)
    @END
    0;JMP