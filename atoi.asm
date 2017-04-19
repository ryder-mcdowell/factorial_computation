section .bss

section .data

section .text
global atoi;

; atoi function: convert ASCII character string to integer number
;
; eax is pointer to ASCII buffer to convert
; ebx is length of buffer (number of digits)
;
; return value (integer dword) stored in eax
	
atoi:
	mov esi,eax
	dec ebx
	mov ecx,10
	mov eax,0

.loop:
	mul ecx		; mul eax(runnning total) by multiplier (10)
	push ecx	; save multiplier
	mov cl,byte [esi]	; move value(ASCII) into ecx
	sub ecx,48	; convert value(ASCII) to integer
	add eax,ecx	; add integer to running total
	pop ecx		; get multiplier back in ecx
	inc esi
	dec ebx
	cmp ebx,0	; check if done
	je .end
	jne .loop
		
.end:
	ret
