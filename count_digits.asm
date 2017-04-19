section .text

global count_digits;

; count_digits counts the number of digits in an integer value
; e.g., 1000 has 4 digits.
;
; eax contains integer value to count 
; return value (number of digits) stored in eax

count_digits:
	mov ebx,0	; reset ebx value for counting

.loop:
	mov edx,0	; clear high bits from division
	mov ecx,10	; setup ecx for dividing
	div ecx		; divide eax by ecx
	inc ebx
	cmp eax,0
	je .end
	ja .loop

.end:
	mov eax,ebx	; move count into eax
	ret

