*-----------------------------------------------------------
* Title      : Input Branching 
* Written by : Sarah Asad 
* Date       : 1/20/22
* Description: sample program 2 from Quickstart Guide 
*-----------------------------------------------------------

START   ORG     $1000

*-------Code for output-------

LOOP    LEA     MESSAGE,A1     
        MOVE.B  #14,D0          
        TRAP    #15       

*-------Code for input-------

        MOVE.B  #4,D0           Trap task 4 does the following:
        TRAP    #15             Read a number from the keyboard into D1.L
        CMP.L   #2150439,D1     Compares D1 to the student ID
        BEQ     DONE            Branch to DONE if they are equal
        
        CMP.B   #20,D1          Compares D1 to 20
        BLT     INVALID         BLT branches if D1 is less than 20
        CMP.B   #25,D1          Compares D1 to 25
        BGT     INVALID         BGT branches if D1 is greater than 25

*--figure out what the number actually is--

                CMP.B   #20,D1           Compares D1 and 20
                BNE     TWENTYONE        BEQ branches if D1 and 20 are not equal
                LEA     DISPONE,A1      
                MOVE.B  #14,D0  
                TRAP    #15
                BRA     LOOP    
                
TWENTYONE       CMP.B   #21,D1           Compares D1 and 21
                BNE     TWENTYTWO        BEQ branches if D1 and 21 are not equal
                LEA     DISPTWO,A1      
                MOVE.B  #14,D0  
                TRAP    #15
                BRA     LOOP

TWENTYTWO       CMP.B   #22,D1           Compares D1 and 22
                BNE     TWENTYTHREE      BEQ branches if D1 and 22 are not equal
                LEA     DISPTHR,A1      
                MOVE.B  #14,D0  
                TRAP    #15
                BRA     LOOP

TWENTYTHREE     CMP.B   #23,D1           Compares D1 and 23
                BNE     TWENTYFOUR       BEQ branches if D1 and 23 are not equal 
                LEA     DISPFOU,A1      
                MOVE.B  #14,D0  
                TRAP    #15
                BRA     LOOP
           
TWENTYFOUR      CMP.B   #24,D1          compare D1 and 24
                BNE     TWENTYFIVE      BEQ brqanches if D1 and 24 are not equal 
                LEA     DISPFIV,A1
                MOVE.B  #14,D0
                TRAP    #15
                BRA     LOOP
    
TWENTYFIVE      LEA     DISPSIX,A1
                MOVE.B  #14,D0
                TRAP    #15
                JMP     LOOP

INVALID         LEA     INV,A1
                MOVE.B  #14,D0  
                TRAP    #15
                
                BRA     LOOP            branch to LOOP
        
DONE            MOVE.B  #25,D0
                TRAP    #15             Halt Simulator

CR      EQU     $0D         
LF      EQU     $0A 

MESSAGE DC.B    'Enter a number between 20 and 25, Enter student ID to exit: ',0
INV     DC.B    'That is not between 20 and 25.',CR,LF,0
DISPONE DC.B    'SARAH',CR,LF,0
DISPTWO DC.B    'ASAD',CR,LF,0
DISPTHR DC.B    'STRAWBERRY',CR,LF,0
DISPFOU DC.B    'OLIVER',CR,LF,0
DISPFIV DC.B    'BELLA',CR,LF,0
DISPSIX DC.B    'LEO',CR,LF,0



        END     START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
