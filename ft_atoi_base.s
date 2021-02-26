section .text
	global ft_atoi_base

ft_atoi_base:
	xor rax, rax	; Result
	mov rcx, -1		; Counter
	xor rbx, rbx	; Counter
	xor rdx, rdx	; Store chars
	mov r8, 1	 	; Store sign
	mov r9, -1		; Base length

check_base_loop:
	inc rcx
	cmp byte [rsi + rcx], 0
	jz check_base
	mov dl, [rsi + rcx]

forbidden_char:
	cmp dl, 9
	je error
	cmp dl, 10
	je error
	cmp dl, 11
	je error
	cmp dl, 12
	je error
	cmp dl, 13
	je error
	cmp dl, 32
	je error
	cmp dl, 43
	je error
	cmp dl, 45
	je error
	mov rbx, rcx

check_base_inner_loop:
	inc rbx
	mov dh, [rsi + rbx]
	cmp dh, 0
	je check_base_loop
	cmp dl, dh
	je error
	jmp check_base_inner_loop

check_base:
	cmp rcx, 1
	jle error
	mov rbx, -1
	mov r9, rcx

skip_spaces:
	inc rbx
	mov dl, [rdi + rbx]
	cmp dl, 9
	je skip_spaces
	cmp dl, 10
	je skip_spaces
	cmp dl, 11
	je skip_spaces
	cmp dl, 12
	je skip_spaces
	cmp dl, 13
	je skip_spaces
	cmp dl, 32
	je skip_spaces
	dec rbx
	jmp skip_signs

handle_sign:
	neg r8

skip_signs:
	inc rbx
	mov dl, [rdi + rbx]
	cmp dl, 43
	je skip_signs
	cmp dl, 45
	je handle_sign
	mov rcx, -1

atoi:
	inc rcx
	mov dl, [rdi + rcx]
	mov rbx, -1
	cmp dl, 0
	je exit
	jmp set_index

add_total:
	mul r9
	add rax, rbx
	jmp atoi

set_index:
	inc rbx
	mov dh, [rsi + rbx]
	cmp dh, 0
	je exit
	cmp dl, dh
	jne set_index
	jmp	add_total

exit:
	mul r8
	ret

error:
	xor rax, rax
	ret
