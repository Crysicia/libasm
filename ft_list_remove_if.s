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
	mov		rdi, [rbx]
	call	rdx
	pop		rdx
	pop		rdi
	pop		rsi
	cmp		rax, 0
	je		remove

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
	push	rdx
	push	rdi
	mov		rdi, [rbx]
	call	r10
	pop		rdi
	pop		rdx
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


; section	.text
; 		global	ft_list_remove_if
;         extern  free

; ft_list_remove_if:
;         cmp     _begin_list_RDI, 0
;         je      done
;         cmp     _com_RDX, 0          ; _com_RDX = arg3
;         je      done
;         cmp     _free_fct_RCX, 0          ; _free_fct_RCX = arg4
;         je      done
;         jmp     first

; remove_first:
;         mov	_current, [_begin_list_RDI]
; 		mov	_next, [_current + 8]
;         ; push    _begin_list_RDI
;         ; push    rsi
;         ; push    _com_RDX
;         ; push    _free_fct_RCX
;         ; push    _current
;         ; push    _next
;         mov     _begin_list_RDI, [_current]
;         call    _free_fct_RCX
;         ; pop     _begin_list_RDI
;         ; push    _begin_list_RDI
;         mov     _begin_list_RDI, _current
;         call    free
;         ; pop     _next
;         ; pop     _current
;         ; pop     _free_fct_RCX
;         ; pop     _com_RDX
;         ; pop     rsi
;         ; pop     _begin_list_RDI
;         mov     [_begin_list_RDI], _next

; first:
;         mov     _current, [_begin_list_RDI]
;         cmp     _current, 0
;         je      done
;         ; push    _begin_list_RDI
;         ; push    rsi
;         ; push    _com_RDX
;         ; push    _free_fct_RCX
;         mov     _begin_list_RDI, [_current]
;         call    _com_RDX
;         ; pop     _free_fct_RCX
;         ; pop     _com_RDX
;         ; pop     rsi
;         ; pop     _begin_list_RDI
;         cmp     rax, 0
;         je      remove_first
;         mov     _current, [_begin_list_RDI]
;         jmp     compare

; remove:
;         mov	_begin_list_RDI, _next
;         mov     _next, [_next + 8]
;         mov     [_current + 8], _next
;         mov     r10, _begin_list_RDI
;         ; push    _begin_list_RDI
;         ; push    rsi
;         ; push    _com_RDX
;         ; push    _free_fct_RCX
;         ; push    _current
;         ; push    _next
;         mov     _begin_list_RDI, [_begin_list_RDI]
;         call    _free_fct_RCX
;         ; pop     _begin_list_RDI
;         mov     _begin_list_RDI, r10
;         ; push    _begin_list_RDI
;         call    free
;         ; pop     _next
;         ; pop     _current
;         ; pop     _free_fct_RCX
;         ; pop     _com_RDX
;         ; pop     rsi
;         ; pop     _begin_list_RDI

; compare:
;         mov     _next, [_current + 8]
;         cmp     _current, 0
;         je      done
;         cmp     _next, 0
;         je      done
;         ; push    _begin_list_RDI
;         ; push    rsi
;         ; push    _com_RDX
;         ; push    _free_fct_RCX
;         ; push    _current
;         ; push    _next
;         mov     _begin_list_RDI, [_next]
;         call    _com_RDX
;         ; pop     _next
;         ; pop     _current
;         ; pop     _free_fct_RCX
;         ; pop     _com_RDX
;         ; pop     rsi
;         ; pop     _begin_list_RDI
;         cmp     rax, 0
;         je      remove
;         mov     _current, _next
;         jmp     compare
; done:
;         ret
