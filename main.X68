*-----------------------------------------------------------
* Title      :  Team Bits Disassembler
* Written by :  Himanshu Mehru, William Tanna, Igor Ummel
* Date       :  Who cares? Our code is timeless mofo.
* Description:  Bish, you know what the fuck dis shiit izz.
*-----------------------------------------------------------
    ORG    $1000
START:                  
    
            LEA        INTRO,A1     Display intro message
            MOVE.B     #14,D0
            TRAP       #15
 
            BRA        START_ADDR   Branch to request starting address

    SIMHALT             ; halt simulator

START_ADDR  LEA        ST_ADDR,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
            
            LEA        $5000,A1     Stores user input into address $5000
            MOVE.B     #2,D0
            TRAP       #15
            BRA        END_ADDR     Branch to request ending address
            
END_ADDR    LEA        EN_ADDR,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
            
            LEA        $5010,A1     Stores user input into address $5010
            MOVE.B     #2,D0
            TRAP       #15
********************************************************
* DISPLAY MESSAGES                                     *
********************************************************

CR          EQU     $0D
LF          EQU     $0A
INTRO       DC.B    'Disassembler Program for Team Bits',CR,LF,0
ST_ADDR     DC.B    'Please enter a starting address: ',0
EN_ADDR     DC.B    'Please enter an ending address: ',0
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
