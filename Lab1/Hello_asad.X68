*-----------------------------------------------------------
* Title      : Hello World 
* Written by : Sarah Asad 
* Date       : 1/20/22
* Description: Sample program 1 for QuickStart Guide 
*-----------------------------------------------------------
START   ORG     $1000

*-------Code for output------
        LEA     MESSAGE,A1      Loads MESSAGE into address register A1
        MOVE.B  #14,D0          Moves the number 14 into data register D0
        TRAP    #15             Displays Message

	    MOVE.B	#9,D0
	    TRAP	#15		        Halt Simulator
	    
CR      EQU     $0D             ASCII code for Carriage Return
LF      EQU     $0A             ASCII code for Line Feed
MESSAGE DC.B    'Hello, My name is Sarah Asad',CR,LF
        DC.B    'I am getting familiarized with coding in Assembly and using 68K',CR,LF,CR,LF
        DC.B    'Thank you for listening.',CR,LF,0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
