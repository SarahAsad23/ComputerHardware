* Written by : Sarah Asad 
* Date       : 1/28/22
* Description: program to add 2 numbers together and display in decimal format 
*-----------------------------------------------------------
   
START:    ORG    $1000               ; first instruction of program

    * output 
    
    LEA     MESSAGE1,A1 ;load message 1 into A1 
    MOVE.B  #14,D0
    TRAP    #15
        
    *input: Get the first number.
    
    MOVE.L  #4,D0
    TRAP    #15     ;read number 1 from keyboard - store in D0
    MOVE.L  D1, D2  ;Save the returned number in D2.L
    
    * input: Get the second number.
    
    MOVE.L  #4,D0   ;read number 2 from keyboard - store in D1
    TRAP    #15
    
    * Add the numbers and check for overflow.
   
    ADD.L D2, D1      ; Add D1 and D2 and store the result in D1.
    BVS Display_Overflow

    * Since there was no overflow, store and display the number.
    
    MOVE.L D1, $6000    ; Store at memory location $6000 
    
    MOVE.L  #10, D2     ; Set the base to 10
    MOVE.L  #3, D0 
    TRAP #15   

    LEA     NEWLINE,A1  ;load message 1 into A1 
    MOVE.L  #14,D0
    TRAP    #15
    
    JMP START

Display_Overflow:   

    * Display the overflow message.
    
    LEA ERROR, A1
    MOVE.L #14, D0
    TRAP #15
    JMP START

* Put variables and constants here

MESSAGE1 DC.B   'Enter 2 numbers: ' ,0  ;ask user for input 

ERROR    DC.B   'Overflow occured ' , 10, 13, 0  ;overflow message 

NEWLINE DC.B    10, 13, 0

    END    START 

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
