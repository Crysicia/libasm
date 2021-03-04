section .text
	global ft_list_sort

ft_list_sort:
	xor		rcx, rcx
	xor		r10, r10
	xor		r8, r8

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	mov		rbx, [rdi]
	jmp		sort

; list_next:
; 	mov		r10, rbx
; 	mov		rbx, [rbx + 8]

sort:
	cmp		rbx, 0
	je		exit

sort_loop:
	; jmp list_next

sort_inner_loop:
	jmp sort_inner_loop

update_head:
	

exit:
	ret
