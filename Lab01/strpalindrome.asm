;Program to check if the given string is palindrome or not
;	Objective: To check palindrome property of the string
;	Input: string
;	Output: Yes/No depending on the input
%include "io.mac"

.DATA
	prompt_msg db "Enter your string : ",0
 	out_yes db "String is a palindrome",0
 	out_no db "String is not a palindrome",0

.UDATA
	str_in resb 100    

.CODE
    .STARTUP                        ; setup
        PutStr prompt_msg
        GetStr str_in,100			;input the string
        xor EAX,EAX					;setting EAX as 0
        length:
        	mov DL,[str_in + EAX]	;taking byte by byte in the DL register
        	inc EAX					;increasing EAX, so that it computes the length
        	cmp DL,0
        jne length 					;at the end of loop, string + EAX points to the null character
        dec EAX
        dec EAX						
        mov ECX,str_in
        mov EDX,str_in
        add EDX,EAX					;EDX points to the last character
        PutStr str_in
        nwln
        palin:
        	mov AL,byte[ECX]			;character from the start (or the ECX pointer)
        	mov BL,byte[EDX]			;character from the end (or the EDX pointer)
        	cmp Al,BL
        jne not_palindrome 			;if any of the character is not equal, end the loop and report it as not a palindrome
        	dec EDX					;decreasing the end pointer
        	inc ECX					;increasing the start pointer
        	cmp ECX,EDX				
        jle palin 					;if the start pointer overtakes end pointer, end the loop
        PutStr out_yes
        jmp done
        not_palindrome:
        	PutStr out_no
        done:
        	nwln
    	.EXIT                           ; return control