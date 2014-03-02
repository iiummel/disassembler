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
            
            JSR        ASC_HEX          Convert ascii to hex
            MOVEA.L    D3,A5         

END_ADDR    LEA        EN_ADDR_MSG,A1   Display starting address message
            MOVE.B     #14,D0
            TRAP       #15
            
            LEA        EN_INPUT,A1      Stores user input into memory
            MOVEQ      #2,D0
            TRAP       #15
            CLR.L      D3               Clear D3 so that ending address can be stored
            JSR        ASC_HEX          Branch to ascii to hex convesion 
            MOVEA.L    D3,A6

ASC_HEX     CMPI.B      #$0,D1          Check to see if all ascii characters are converted
            BEQ         END
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

END         RTS
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
