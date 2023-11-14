
include 'emu8086.inc'

org 100h 
     
jmp START       
enter_message db 0Dh,0Ah,  "Enter a message: $"   
string        db 27 dup(' ')
encrypt       db 0Dh,0Ah,  "Encrypted message: $"
DEFINE_PRINT_NUM_UNS 
decrypt       db 0Dh,0Ah,  "decrypted message: $" 


START:                                  ; table
            MOV CX,26                   ;26 letters
            MOV AL,61h                  ;put in AL a
            MOV DI,300h                 
            CLD                         ;clear direction flag  
            
LETTERS:    STOSB 
            INC AL
            LOOP LETTERS
            
            MOV CX,26                   ;26 numbers
            MOV AL,1                    ;put in AL a
            MOV DI,360h 
            
NUMBERS:    STOSB 
            INC AL
            LOOP NUMBERS
            
           
PROGRAM:    
            LEA DX, enter_message
            MOV AH, 9 
            INT 21h   
            
            LEA DX, string
            MOV AH, 0Ah
            INT 21H
            
            MOV BX,0                    ;
            MOV BL, string[1]           ;buffer[1] contains the actual size of the array
            MOV string[BX + 2], '$'     ;to terminate the array so that we can encrypt to the end  
            
                                     
            LEA DX, encrypt
            MOV AH, 9 
            INT 21h    
            
            MOV DI, 2FFh                ;360-61 so that xlatb is al+bx = 2ff + 'a' = 360 start of the numbers table             
            MOV BX, DI
            LEA SI, string[2]      
            
NEXT:
	        CMP [SI], '$'               ;end of message
	        JE FIN	         
	        
	        LODSB                       ;char into AL, then moves SI to next char 
	                                    ;check if char in range from a to z
	        CMP AL, 'a'
	        JB  NEXT                    ;If wrong, jump if below 
	        CMP AL, 'z'
	        JA  NEXT                    ;jump if above 
	        XLATB                       ; translate 
            MOV [SI-1], AL              ;put translation in place
            MOV AH,0 
            CALL PRINT_NUM_UNS          ;predefined            
            JMP NEXT

            
FIN:                                    ;decryption
            MOV BX, DI
            LEA SI, string[2]  
            
NEXT1:
	        CMP [SI], '$'               ;end of message
	        JE FIN1	         
	        
	        LODSB                        
	                                    
	        CMP AL, 1
	        JB  NEXT1                     
	        CMP AL, 26
	        JA  NEXT1                     
	        XLATB                       
            MOV [SI-1], AL              
            MOV AH,0                   
            JMP NEXT1
     
                 
FIN1:       
            LEA DX, decrypt
            MOV AH, 9
            INT 21h
      
            LEA DX, string + 2
            MOV AH, 9
            INT 21h           
            
          
            
  
            JMP PROGRAM 

end 




