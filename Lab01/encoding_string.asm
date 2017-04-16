;Program to check if the given string is palindrome or not
;	Objective: To give an encoded output of a string of numbers
;	Input: string of numbers
;	Output: Encoded string
%include "io.mac"

.DATA
	prompt_msg1 db "Enter the input string : ",0
	prompt_msg2 db "The output encoded string is : ",0
	prompt_msg3 db "Do you want to continue or not(Y/N)? ",0
	rule db "4695031872",0

.UDATA
	input_string resb 100
	response resb 1

.CODE
	.STARTUP
		loop1:
			PutStr prompt_msg1
			GetStr input_string,100			;input the string
			mov EAX,input_string 			;EAX serves as a pointer to string
			loop2:
				mov BL,byte[EAX]			;comparing the byte for different possibilities
				cmp BL,'0'
			je loop3
				cmp BL,'1'
			je loop3
				cmp BL,'2'
			je loop3
				cmp BL,'3'
			je loop3
				cmp BL,'4'
			je loop3
				cmp BL,'5'
			je loop3
				cmp BL,'6'
			je loop3
				cmp BL,'7'
			je loop3
				cmp BL,'8'
			je loop3
				cmp BL,'9'
			je loop3
			jmp loop5 						;if no bit matches with a number, jump to the next character
			loop3:
				mov CL,'0'					;populating CL with ASCII value of 0
				xor EDX,EDX					;setting EDX to 0 - EDX counts the offset
				dec CL						
				loop4:
					inc CL
					inc EDX
					cmp CL,BL
				jne loop4 					;continue loop until CL and BL has the same value
				dec DL
				mov BL,byte[rule+EDX]		;insert the encoded bit in BL
				mov byte[EAX],BL			;changing the byte of the original string in encoded form
			loop5:
				inc EAX
				cmp AL,0
			jne loop2 						;if not the end of string go back to taking another byte
			PutStr prompt_msg2
			PutStr input_string
			nwln
			PutStr prompt_msg3
			GetStr response,1
			cmp byte[response],'y'
		je loop1
			cmp byte[response],'Y'
		je loop1
	.EXIT