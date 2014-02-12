*-----------------------------------------------------------
* Title      :Final Project Disassembler
* Written by :Himanshu Mehru, Igor Ummel, Will Tanna    
* Date       :02-08-2014
* Description: This program disassembles machine code to Assembly Lanuage
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
*Code for Welcome Message
    LEA  WELCOME_MESSAGE, A1
    MOVE.B #14, D0
    TRAP   #15

    
* Code for starting address  //NOTE: ***********check for correct input 
    LEA  START_ADD_MESSAGE, A1 * load start address message into A1
    MOVE.B #14, D0              *Trap Task 14 prints D0 contents to console
    TRAP   #15

    MOVE.B  #4, D0              *Trap task 4 reads a number 
    TRAP    #15
    MOVE.L  D1,D0               *start address is in D0
 

* Code for ending address  //NOTE: ***********check for correct input 
    LEA  END_ADD_MESSAGE, A1    * load end address message into A1
    MOVE.B #14, D0              *Trap Task 14 prints D0 contents to console
    TRAP   #15

    MOVE.B  #4, D0              *Trap task 4 reads a number 
    TRAP    #15
    MOVE.L  D1,D2               *end address is in D2
    
*Code for displaying everything from starting address to ending address
LOOP        
        MOVE.L D0, D1
        MOVE.B #15, D0
        TRAP #15        
           
        
        MOVE.L D1, D0
        CMP.L   D0, D2
        BEQ     DONE
        ADD.B #01, D0
        BRA     LOOP
        
DONE    MOVE.B  #9, D0              *Trap task 9 halts the program
        TRAP    #15


    SIMHALT             ; halt simulator

* Put variables and constants here
CR  EQU $0D *CARRIAGE RETURN
LF  EQU $0A *LINE FEED
WELCOME_MESSAGE DC.B    'Welcome to the Team Bits Final Project',CR,LF
                DC.B    'This is a disassembler where your machine code',CR,LF
                DC.B    'will be transated into 68K assembly language', CR, LF,0
                
START_ADD_MESSAGE   DC.B    'Please enter a starting address: ',0
END_ADD_MESSAGE     DC.B    'Please enter an ending address: ',0
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
