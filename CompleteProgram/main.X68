    INCLUDE "TEST.X68"
*-----------------------------------------------------------
* Title      :  Team Bits Disassembler
* Written by :  Himanshu Mehru, William Tanna, Igor Ummel
* Date       :  Who cares? Our code is timeless mofo.
* Description:  Bish, you know what the fuck dis shiit izz.
*-----------------------------------------------------------
    ORG    $1000
START:                  
    
            LEA        INTRO,A1         Display intro message
            MOVE.B     #14,D0
            TRAP       #15
 
            BRA        START_ADDR       Branch to request starting address

START_ADDR  LEA        ST_ADDR_MSG,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
           
            LEA        ST_INPUT,A1      Stores user input into memory
            MOVEQ      #2,D0
            TRAP       #15
            
            JSR        ASC_HEX          Convert ascii to hex
            MOVEA.L    D3,A5            Store starting address into A5

END_ADDR    LEA        EN_ADDR_MSG,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
            
            LEA        EN_INPUT,A1      Stores user input into memory
            MOVEQ      #2,D0
            TRAP       #15
            CLR.L      D3               Clear D3 so that ending address can be stored
            JSR        ASC_HEX          Branch to ascii to hex convesion 
            MOVEA.L    D3,A6            Store ending address into A6
            
            BRA        LOOP

ASC_HEX     CMPI.B      #$0,D1          Check to see if all ascii characters are converted
            BEQ         DONE
            MOVE.B     (A1)+,D2         Move first number to data register
            CMPI.B      #$39,D2         See if D2 is a number
            BLE         CON_NUM          
            
CON_LET     SUBI.B      #$37,D2         Convert ascii to hex letter
            BRA         COUNTER        

CON_NUM     SUBI.B      #$30,D2         Convert ascii to hex number
            BRA         COUNTER

            
COUNTER     SUBI.B      #$1,D1          Decrement counter
            ADD.B       D2,D3           Add converted number to rest of convereted address
            CMPI.B      #$0,D1          Check to see if all ascii characters are converted
            BEQ         ASC_HEX        
            ROL.L       #4,D3           Move converted address number to the left to add new number.

            BRA         ASC_HEX

DONE         RTS

LOOP        MOVE.W  (A5)+, D6           Move instruction to D6
            LEA     goodbuffer, A3
            JSR     FIRST4BITS          Get the first 4 bits of the instruction
            CMP.W   A5, A6
            BEQ     END
            BRA     LOOP

FIRST4BITS
            MOVE.W  D6, D5              Move the instruction so we can shift it
            LSR.W   #8, D5
            LSR.W   #4, D5
            MULU    #8, D5             Offset D5 to show the word binary for the instruction
            LEA     INSTTABLE, A0      Set the table to A0 so we know where to jump to
            JSR     00(A0,D5)          Set jumptable
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
* 0000 - ADDI, ANDI, BCHG, CMPI, EORI INSTRUCTION'S    *
********************************************************
INSTR0000   RTS
********************************************************
* 0001 - MOVE.B INSTRUCTION                            *
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
* 0010 - MOVE.L INSTRUCTION                            *
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
* 0011 - MOVE.W INSTRUCTION                            *
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
* 0100 - CLR, JSR, LEA, MOVEM, RTS INSTRUCTION'S       *                              
********************************************************
INSTR0100   
    RTS
********************************************************
* 0101 - SUBQ INSTRUCTION                              *       
********************************************************
INSTR0101
    RTS
********************************************************
* 0110 - BGT, BLE, BVS INSTRUCTION'S                   *                  
********************************************************
INSTR0110   
    RTS
********************************************************
* 0111 - MOVEQ INSTRUCTION                             *        
********************************************************
INSTR0111
    MOVE.B  #'M',(A3)+
    MOVE.B  #'O',(A3)+
    MOVE.B  #'V',(A3)+
    MOVE.B  #'E',(A3)+
    MOVE.B  #'.',(A3)+
    MOVE.B  #'Q',(A3)+
    MOVE.B  #' ',(A3)+
    JSR     EACODE
    RTS
********************************************************
* 1000 - DIVU INSTRUCTION                              *       
********************************************************
INSTR1000
    MOVE.B  #'D',(A3)+
    MOVE.B  #'I',(A3)+
    MOVE.B  #'V',(A3)+
    MOVE.B  #'U',(A3)+
    MOVE.B  #' ',(A3)+
    JSR     EACODE
    RTS
********************************************************
* 1001 - SUB, SUBA INSTRUCTION'S                       *              
********************************************************
INSTR1001   
    RTS
********************************************************
* 1011 - CMP, CMPA, EOR INSTRUCTION'S                  *                   
********************************************************
INSTR1011   
    RTS
********************************************************
* 1100 - AND, MULS INSTRUCTION'S                       *              
********************************************************
INSTR1100   
    RTS
********************************************************
* 1110 - ASR, LSL, ROL INSTRUCTION'S                   *                  
********************************************************
INSTR1110   
    RTS
********************************************************
* 1101 - ADD, ADDA INSTRUCTION'S                       *               
********************************************************
INSTR1101   
    RTS

********************************************************
* EA CODE                                              *
********************************************************
EACODE
    LEA     goodbuffer, A1
    MOVEQ   #13, D0
    TRAP    #15
    RTS

END
    SIMHALT             ; halt simulator
    
********************************************************
* DISPLAY MESSAGES                                     *
********************************************************
CR          EQU     $0D
LF          EQU     $0A
INTRO       DC.B    'Disassembler Program for Team Bits',CR,LF,0
ST_ADDR_MSG DC.B    'Please enter a starting address: ',0
EN_ADDR_MSG DC.B    'Please enter an ending address: ',0
ST_INPUT    DS.B    80                  Stores starting address input
EN_INPUT    DS.B    80                  Stores ending address input
goodbuffer  DC.B    80  
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
