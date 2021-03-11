section .text
	global	ft_list_remove_if
	extern	free

; rdi = **begin_list
; rsi = *data_ref
; rdx = *com
; rcx = *free_fct
ft_list_remove_if:
	xor		rax, rax
	xor		r10, r10 ; PREC
	xor		r8, r8

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	cmp		rdx, 0
	je		exit
	cmp		rcx, 0
	je		exit
	mov		rbx, [rdi] ; CURR
	jmp		compare

list_next:
	mov		r10, rbx
	mov		rbx, [rbx + 8]

compare:
	cmp		rbx, 0
	je		exit
	push	rsi
	push	rdi
	push	rdx
	push	r10
	push	rcx
	mov		rdi, [rbx]
	call	rdx
	pop		rcx
	pop		r10
	pop		rdx
	pop		rdi
	pop		rsi
	cmp		rax, 0
	jne		list_next
	mov		r8, [rbx + 8]
	cmp		r10, 0
	je		update_head
	mov		[r10 + 8], r8

remove:
	push	rdx
	push	rsi
	push	rcx
	push	r10
	push	r8
	push	rdi
	mov		rdi, [rbx]
	call	rcx
	pop		rdi
	push	rdi
	mov		rdi, rbx
	call	free wrt ..plt
	pop		rdi
	pop		r8
	pop		r10
	pop 	rcx
	pop		rsi
	pop		rdx
	mov		rbx, r8
	cmp		rbx, 0
	je		exit
	jmp		compare

update_head:
	mov		[rdi], r8
	jmp		remove

exit:
	ret
