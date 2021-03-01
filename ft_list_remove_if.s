section .text
	global	ft_list_remove_if

; rdi = **begin_list
; rsi = *data_ref
; rdx = *com
; r10 = *free_fct
ft_list_remove_if:
	xor		rax, rax
	xor		rbx, rbx ; CURR
	xor		rcx, rcx ; PREC
	xor		r8, r8

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	mov		rbx, [rdi]
	mov		rcx, 0
	
compare:
	mov		r8, rsi
	push	rsi
	push	rdi
	push	rdx
	push	rcx
	mov		rsi, r8
	mov		rdi, [rbx + 8]
	call	rdx
	pop		rcx
	pop		rdx
	pop		rdi
	pop		rsi
	cmp		rax, 0
	je		remove

list_loop:
	mov		rcx, rbx
	mov		rbx, [rbx + 8]
	cmp		rbx, 0
	je		exit
	jmp		compare

remove:
	push	rdi
	mov		rdi, [rbx]
	call	r10
	pop		rdi
	cmp		rcx, 0
	je		update_head
	mov		r8, [rbx + 8]
	mov		[rcx + 8], r8
	jmp		compare

update_head:
	mov		r8, [rbx + 8]
	mov		[rdi], r8
	mov		rbx, [rdi]
	jmp		compare

exit:
	ret
