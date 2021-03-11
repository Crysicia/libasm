section .text
	global ft_list_sort

ft_list_sort:
	xor		rcx, rcx
	xor		r10, r10
	mov		r8, 1

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	mov		rbx, [rdi]
	cmp		rbx, 0
	je		exit

sort:
	cmp		r8, 0
	je		exit
	xor		r8, r8
	mov		rbx, [rdi]
	cmp		rbx, 0
	je		exit
	mov		rcx, [rbx + 8]

sort_loop:
	cmp		rcx, 0
	je		sort
	push	rdi
	push	rsi
	push	rcx
	push	rbx
	push	r8
	mov		r8, rsi
	mov		rdi, [rbx]
	mov		rsi, [rcx]
	call	r8
	pop		r8
	pop		rbx	
	pop		rcx
	pop		rsi
	pop		rdi
	jg  	swap

increment_loop:
	mov		rbx, rcx
	mov		rcx, [rcx + 8]
	jmp		sort_loop

swap:
	mov		r8, 1
	mov		rax, [rcx]
	mov		r10, [rbx]
	mov		[rcx], r10
	mov		[rbx], rax
	jmp		increment_loop

exit:
	ret
