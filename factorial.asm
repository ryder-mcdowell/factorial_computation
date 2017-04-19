section .data

section .text

global factorial

; factorial function calculate N! (N factorial) for input N
;
; eax holds N, the integer to factorial
; return value N! (N factorial) stored in eax

factorial:
	cmp eax,0
	je .zero
	mov ecx,eax 	; N -> ecx

.loop:
	sub ecx,1
	cmp ecx,0
	je .end
	mul ecx
	jne .loop

.zero:
	mov eax,1
	jmp .end

.end:
	ret

