;Sum of two matrices
;Author : Abhishek
;Roll No. : B15103
;CS201 Assembly Language Lab02 Program
;	sumMatrices.asm
;Objective : To compute the sum of two matrices
;Input : The contents of two matrices A and B
;Output : The contents of matrix C = A + B

%include "io.mac"

.DATA
	prompt_msg1 db "Enter the number of rows (rows * colums < 500): ",0
	prompt_msg2 db "Enter the number of columns (rows * colums < 500): ",0
	prompt_msg3A db "Enter the contents of matrix A (each content should be of 1 byte)",0
	prompt_msg3B db "Enter the contents of matrix B (each content should be of 1 byte)",0
	prompt_msg4 db "Row ",0
	prompt_msg5 db " ",0
	prompt_msg6 db "|",0

.UDATA
	A resw 500		;A stores 500 inputs of size 2 bytes
	B resw 500		;B stroes 500 inputs of size 2 bytes
	C resw 500		;C stores 500 inputs of size 2 bytes
	r resw 1
	c resw 1
	p resw 1

.CODE
	.STARTUP

		;Asking for number of rows
		PutStr prompt_msg1
		GetInt [r]
		mov AX,[r]
		PutInt [r]

		;Asking for number of columns
		PutStr prompt_msg2
		GetInt [c]
		mov BX,[c]

		;multiplying values of row and column
		imul AX,BX
		mov [p],AX

		PutInt AX
		nwln

		;resetting value of AX as number of rows
		;mov AX,[r]

		;Getting input for A
		PutStr prompt_msg3A
		nwln
		push word[p]
		push A
		call read_matrix
		push word[c]
		push word[r]
		push A
		call print_matrix
		nwln

	done:
		.EXIT

read_matrix:
	enter 0,0
	;EBP+12 is the size of the matrix
	;EBP+8 is the address of the matrix

	;moving the address of the matrix in ECX
	mov ECX,[EBP+8]
	;assigning AX as the size counter
	mov AX,0
	loop_read:
		GetInt BX
		mov [ECX],BX
		add ECX,2
		inc AX
		cmp AX,[EBP+12]
	jne loop_read
	loop_read_end:
		leave
		ret 6

print_matrix:
	enter 0,0
	;EBP+14 is the number of columns of the matrix
	;EBP+12 is the number of rows of the matrix
	;EBP+8 is the address of the matrix

	;moving the address of the matrix in ECX
	mov ECX,[EBP+8]
	;assigning AX as the column counter
	mov AX,0
	;assigning BX as the row counter
	mov BX,0

	loop_print:
		PutStr prompt_msg4
		inc BX
		PutInt BX
		dec BX
		PutStr prompt_msg5
		PutStr prompt_msg6
		loop_print_row:
			PutInt word[ECX]
			PutStr prompt_msg5
			add ECX,2
			inc AX
			cmp AX,word[EBP+14]
		jne loop_print_row
		nwln
		mov AX,0
		inc BX
		cmp BX,word[EBP+12]
	jne loop_print
	loop_print_end:
		leave
		ret 8