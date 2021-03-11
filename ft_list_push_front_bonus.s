section .text
	global	ft_list_push_front
	extern	malloc

ft_list_push_front:
	xor		rax, rax
	xor		rbx, rbx

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit

alloc:
	push	rdi
	push	rsi
	mov		rdi, 16
	call	malloc wrt ..plt
	cmp		rax, 0
	je		exit
	pop		rsi
	pop		rdi
	mov		[rax], rsi

push_front:
	mov		rbx, [rdi]
	mov		[rax + 8], rbx
	mov		[rdi], rax

exit:
	ret
