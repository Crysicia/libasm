section .text
	global	ft_list_remove_if

; rdi = **begin_list
; rsi = *data_ref
; rdx = *com
; r10 = *free_fct
ft_list_remove_if:
	xor		rax, rax
	xor		rcx, rcx ; PREC
	xor		r8, r8

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	mov		rbx, [rdi] ; CURR
	
compare:
	cmp		rbx, 0
	je		exit
	push	rsi
	push	rdi
	mov		rdi, rbx
	call	rdx
	pop		rdi
	pop		rsi
	cmp		rax, 0
	je		dispatch

list_loop:
	mov		rcx, rbx
	mov		rbx, [rbx + 8]
	jmp		compare

dispatch:
	cmp		rcx, 0
	je		update_head
	mov		rax, [rbx + 8]
	mov		[rcx + 8], rax

remove:
	push	rdi
	mov		rdi, rbx
	call	r10
	pop		rdi
	jmp		compare

update_head:
	mov		rax, [rbx + 8]
	mov		[rdi], rax
	mov		rbx, [rdi]
	jmp		remove

exit:
	ret
