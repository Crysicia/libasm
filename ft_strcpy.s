section .text
	global ft_strcpy

; rdi: src, rsi: dst
ft_strcpy:
	mov		rax, rdi

copy:
	mov		al, [rsi]
	mov		[rdi], al
	inc		rdi
	inc		rsi
	cmp		al, 0
	jnz		copy

exit:
	ret
