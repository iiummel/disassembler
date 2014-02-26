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

    SIMHALT             ; halt simulator

START_ADDR  LEA        ST_ADDR_MSG,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
           
            LEA        ST_INPUT,A1      Stores user input into memory
            MOVEQ      #2,D0
            TRAP       #15
            
            BRA        ASC_HEX           Convert ascii to hex         
            *BRA END_ADDR

END_ADDR    LEA        EN_ADDR_MSG,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
            
            LEA        EN_INPUT,A1      Stores user input into memory
            MOVEQ      #2,D0
            TRAP       #15
            BRA        ASC_HEX           Convert ascii to hex    

ASC_HEX     MOVE.B     (A1)+,D2
            CMPI.B      #$39,D2          See if D2 is a number
            BLE         CON_NUM
CON_LET     SUBI.B      #$37,D2
            CMPI.B      #$10,D2
            BEQ         CON_A
            CMPI.B      $#9,D2
            
CON_A       MOVEQ      #$A,D2

    SIMHALT
CON_NUM     SUBI.B      #$30,D2
    SIMHALT
********************************************************
* DISPLAY MESSAGES                                     *
********************************************************

CR          EQU     $0D
LF          EQU     $0A
INTRO       DC.B    'Disassembler Program for Team Bits',CR,LF,0
ST_ADDR_MSG DC.B    'Please enter a starting address: ',0
EN_ADDR_MSG DC.B    'Please enter an ending address: ',0
ST_INPUT    DS.B    80
EN_INPUT    DS.B    80
    END    START        ; last line of source







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
