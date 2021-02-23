section .text
	global ft_strdup
	extern malloc

ft_strdup:
	mov rax, -1

strlen:
	inc rax
	cmp byte [rdi + rax], 0
	jnz strlen

alloc:
	push rdi
	mov rdi, rax
	call malloc wrt ..plt
	pop rdi
	cmp rax, 0
	jz exit

; copy:
; 	mov		al, [rsi]
; 	mov		[rdi], al
; 	inc		rdi
; 	inc		rsi
; 	cmp		al, 0
; 	jnz		copy

exit:
	ret
