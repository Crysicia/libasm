section .text
	global ft_strcpy

; rdi: src, rsi: dst
ft_strcpy:
	mov	rcx, -1

copy:
	inc	rcx
	mov	al, [rsi + rcx]
	mov	[rdi + rcx], al
	cmp	al, 0
	jnz	copy

exit:
	mov	rax, rdi
	ret
