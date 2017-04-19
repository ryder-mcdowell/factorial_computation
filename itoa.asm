section .bss

section .data
x dd 0

section .text
global itoa;

; eax is integer to be converted to ASCII
; ebx is number of digits in integer
; ecx is output buffer to fill with ASCII characters
; e.g., integer 40320 gets converted to ASCII '40320'

itoa:
	mov [x],ebx

.loop:
	mov edx,0	; reset edx for division
	mov ebx,10	; set ecx as divider
	div ebx		; divide integer by ecx(10)
	add edx,48	; convert remainder
	push edx	; save remainder
	cmp eax,0	; check if done
	jne .loop
	je .restoreb

.restoreb:
	mov ebx,[x]
	jmp .popp

.popp:
	pop edx			; get latest remainder back
	mov byte [ecx],dl	; fill buffer
	inc ecx
	dec ebx
	cmp ebx,0		; check if done
	je .end
	jne .popp

.end:
	ret

