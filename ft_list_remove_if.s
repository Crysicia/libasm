section .text
	global	ft_list_remove_if
	extern	free

; rdi = **begin_list
; rsi = *data_ref
; rdx = *com
; r10 = *free_fct
ft_list_remove_if:
	xor		rax, rax
	mov		r10, rcx
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
	push	rdx
	mov		rdi, rbx
	call	rdx
	pop		rdx
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
	push	rsi
	push	rdi
	push	rdx
	mov		rdi, rbx
	call	r10
	pop		rdx
	pop		rdi
	pop		rsi
	jmp		compare

update_head:
	mov		rax, [rbx + 8]
	mov		[rdi], rax
	jmp		remove

exit:
	ret


; section	.text
; 		global	ft_list_remove_if
;         extern  free

; ft_list_remove_if:
;         cmp     rdi, 0
;         je      done
;         cmp     rdx, 0          ; rdx = arg3
;         je      done
;         cmp     rcx, 0          ; rcx = arg4
;         je      done
;         jmp     first

; remove_first:
;         mov	r8, [rdi]
; 		mov	r9, [r8 + 8]
;         ; push    rdi
;         ; push    rsi
;         ; push    rdx
;         ; push    rcx
;         ; push    r8
;         ; push    r9
;         mov     rdi, [r8]
;         call    rcx
;         ; pop     rdi
;         ; push    rdi
;         mov     rdi, r8
;         call    free
;         ; pop     r9
;         ; pop     r8
;         ; pop     rcx
;         ; pop     rdx
;         ; pop     rsi
;         ; pop     rdi
;         mov     [rdi], r9

; first:
;         mov     r8, [rdi]
;         cmp     r8, 0
;         je      done
;         ; push    rdi
;         ; push    rsi
;         ; push    rdx
;         ; push    rcx
;         mov     rdi, [r8]
;         call    rdx
;         ; pop     rcx
;         ; pop     rdx
;         ; pop     rsi
;         ; pop     rdi
;         cmp     rax, 0
;         je      remove_first
;         mov     r8, [rdi]
;         jmp     compare

; remove:
;         mov	rdi, r9
;         mov     r9, [r9 + 8]
;         mov     [r8 + 8], r9
;         mov     r10, rdi
;         ; push    rdi
;         ; push    rsi
;         ; push    rdx
;         ; push    rcx
;         ; push    r8
;         ; push    r9
;         mov     rdi, [rdi]
;         call    rcx
;         ; pop     rdi
;         mov     rdi, r10
;         ; push    rdi
;         call    free
;         ; pop     r9
;         ; pop     r8
;         ; pop     rcx
;         ; pop     rdx
;         ; pop     rsi
;         ; pop     rdi

; compare:
;         mov     r9, [r8 + 8]
;         cmp     r8, 0
;         je      done
;         cmp     r9, 0
;         je      done
;         ; push    rdi
;         ; push    rsi
;         ; push    rdx
;         ; push    rcx
;         ; push    r8
;         ; push    r9
;         mov     rdi, [r9]
;         call    rdx
;         ; pop     r9
;         ; pop     r8
;         ; pop     rcx
;         ; pop     rdx
;         ; pop     rsi
;         ; pop     rdi
;         cmp     rax, 0
;         je      remove
;         mov     r8, r9
;         jmp     compare
; done:
;         ret
