*-----------------------------------------------------------
* Title      :Final Project Disassembler
* Written by :Himanshu Mehru, Igor Ummel, Will Tanna    
* Date       :02-08-2014
* Description: This program disassembles machine code to Assembly Lanuage
*-----------------------------------------------------------
stack   EQU $00005000   *stack pointer
begin   EQU $00000000   * Minimum starting address
end     EQU $00FFFFFE   * Maximum ending address  
 ORG    $1000
START:                  ; first instruction of program
*Code for Welcome Message
    LEA  WELCOME_MESSAGE, A1    *load welcome message into a1
    BSR    printString          *print welcome message to screen
    BSR    newLine              *goto the next line (look at newLine subroutine   
    
* Code for starting address  //NOTE: ***********check for correct input 
    LEA  START_ADD_MESSAGE, A1 * load start address message into A1
    BSR     printString        *print start address message to screen 
    
    MOVE.B  #4, D0              *Trap task 4 reads a number 
    TRAP    #15
    MOVE.L  D1,D0               *start address is in D0
 

* Code for ending address  //NOTE: ***********check for correct input 
    LEA  END_ADD_MESSAGE, A1    * load end address message into A1
    BSR     printString

    MOVE.B  #4, D0              *Trap task 4 reads a number 
    TRAP    #15
    MOVE.L  D1,D2               *end address is in D2
    
* Subroutine to print a message onto the screen
printString
    MOVE.B #14, D0              *Trap task 14 prints D0 contents to console
    TRAP   #15
    RTS
* Subroutine to display Carriage Return and Line Feed
newLine 
    movem.l d0/a1,-(SP)         *push d0 & a1
    move    #14,d0              *task number into D0
    lea     crlf,a1             *address of string
    trap    #15                 *display return, linefeed
    movem.l (SP)+,d0/a1         *restore d0 & a1
    rts                         *return
 
    SIMHALT             ; halt simulator

* Put variables and constants here
CR      EQU     $D               *carriage return only
LF      EQU     $A               *Line feed only
crlf    DC.B    CR, LF, 0         *carriage return & line feed, null
WELCOME_MESSAGE DC.B    'Team Bits Final Project! The 68k Disassembler',CR,LF
                DC.B    'Program Authors: Himanshu Mehru, Igor Ummel, Will Tanna', 0              
                
START_ADD_MESSAGE   DC.B    'Please enter a starting address from $00000000 to $00FFFFFE: ',0
END_ADD_MESSAGE     DC.B    'Please enter an ending address between ',0
ODD_ERROR           DC.B    'Please enter an even address: ',0
OUT_OF_RANGE_MSG    DC.B    'The address you entered is out of range. ',0

NEXT_PAGE_MSG       DC.B    'Not quite finished yet. Please press the return key to view more...',0
    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
