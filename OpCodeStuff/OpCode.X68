    INCLUDE "TEST.X68"
*-----------------------------------------------------------
* Title      :  Team Bits Disassembler
* Written by :  Himanshu Mehru, William Tanna, Igor Ummel
* Date       :  Who cares? Our code is timeless mofo.
* Description:  Bish, you know what the fuck dis shiit izz.
*-----------------------------------------------------------
    ORG    $1000
START:
    MOVE.W  #$7000, A5
    MOVE.W  #$7004, A6
    LEA     goodbuffer, A3

********************************************************
* OP CODE                                              *
********************************************************
    MOVE.W  (A5)+, D6       ;Move instruction to D6
    JSR     FIRST4BITS      ;Get the first 4 bits of the instruction
    
    
FIRST4BITS
    MOVE.W  D6, D5          ;Move the instruction so we can shift it
    LSR.W   #8, D5
    LSR.W   #4, D5
    MULU    #8, D5          ;Offset D5 to show the word binary for the instruction
    LEA     INSTTABLE, A0   ;Set the table to A0 so we know where to jump to
    JSR     00(A0,D5)       ;Set jumptable
    RTS

INSTTABLE
    JSR     INSTR0000       *Call function for instructions that start with 0000
    RTS
    JSR     INSTR0001       *Call function for instructions that start with 0001
    RTS
    JSR     INSTR0010       *Call function for instructions that start with 0010
    RTS
    JSR     INSTR0011       *Call function for instructions that start with 0011
    RTS
    JSR     INSTR0100       *Call function for instructions that start with 0100
    RTS
    JSR     INSTR0101       *Call function for instructions that start with 0101
    RTS
    JSR     INSTR0110       *Call function for instructions that start with 0110
    RTS
    JSR     INSTR0111       *Call function for instructions that start with 0111
    RTS
    JSR     INSTR1000       *Call function for instructions that start with 1000
    RTS
    JSR     INSTR1001       *Call function for instructions that start with 1001
    RTS
    JSR     INSTR1011       *Call function for instructions that start with 1011
    RTS
    JSR     INSTR1100       *Call function for instructions that start with 1100
    RTS
    JSR     INSTR1110       *Call function for instructions that start with 1110
    RTS
    JSR     INSTR1101       *Call function for instructions that start with 1101


********************************************************
* 0000 - ADDI, ANDI, BCHG, CMPI, EORI INSTRUCTION'S    
********************************************************
INSTR0000   RTS
********************************************************
* 0001 - MOVE.B INSTRUCTION                            
********************************************************
INSTR0001   
    MOVE.B  #'M',(A3)+
    MOVE.B  #'O',(A3)+
    MOVE.B  #'V',(A3)+
    MOVE.B  #'E',(A3)+
    MOVE.B  #'.',(A3)+
    MOVE.B  #'B',(A3)+
    MOVE.B  #' ',(A3)+
    JSR     EACODE
    RTS
********************************************************
* 0010 - MOVE.L INSTRUCTION                            
********************************************************
INSTR0010
    MOVE.B  #'M',(A3)+
    MOVE.B  #'O',(A3)+
    MOVE.B  #'V',(A3)+
    MOVE.B  #'E',(A3)+
    MOVE.B  #'.',(A3)+
    MOVE.B  #'L',(A3)+
    MOVE.B  #' ',(A3)+
    JSR     EACODE
    RTS
********************************************************
* 0011 - MOVE.W INSTRUCTION                            
********************************************************
INSTR0011
    MOVE.B  #'M',(A3)+
    MOVE.B  #'O',(A3)+
    MOVE.B  #'V',(A3)+
    MOVE.B  #'E',(A3)+
    MOVE.B  #'.',(A3)+
    MOVE.B  #'W',(A3)+
    MOVE.B  #' ',(A3)+
    JSR     EACODE
    RTS
********************************************************
* 0100 - CLR, JSR, LEA, MOVEM, RTS INSTRUCTION'S                                     
********************************************************
INSTR0100   RTS
********************************************************
* 0101 - SUBQ INSTRUCTION                                     
********************************************************
INSTR0101   RTS
********************************************************
* 0110 - BGT, BLE, BVS INSTRUCTION'S                                     
********************************************************
INSTR0110   RTS
********************************************************
* 0111 - MOVEQ INSTRUCTION                                     
********************************************************
INSTR0111   RTS
********************************************************
* 1000 - DIVU INSTRUCTION                                     
********************************************************
INSTR1000   RTS
********************************************************
* 1001 - SUB, SUBA INSTRUCTION'S                                     
********************************************************
INSTR1001   RTS
********************************************************
* 1011 - CMP, CMPA, EOR INSTRUCTION'S                                     
********************************************************
INSTR1011   RTS
********************************************************
* 1100 - AND, MULS INSTRUCTION'S                                     
********************************************************
INSTR1100   RTS
********************************************************
* 1110 - ASR, LSL, ROL INSTRUCTION'S                                     
********************************************************
INSTR1110   RTS
********************************************************
* 1101 - ADD, ADDA INSTRUCTION'S                                     
********************************************************
INSTR1101   RTS



********************************************************
* EA CODE                                              *
********************************************************
EACODE
    LEA     goodbuffer, A1
    MOVEQ   #13, D0
    TRAP    #15
    

    SIMHALT             ; halt simulator
goodbuffer  DC.B    80    
    
    END    START        ; last line of source















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
