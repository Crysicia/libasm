section .text
	global ft_atoi_base

; int ft_atoi_base(char *str, char *base)
ft_atoi_base:
	xor rax, rax
	mov rcx, -1
	xor rdx, rdx
	xor rbx, rbx
	xor r8, r8

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
	mov dh, byte [rsi + rbx]
	cmp dh, 0
	jz check_base_loop
	cmp dl, dh
	je error
	jmp check_base_inner_loop

check_base:
	cmp rcx, 1
	jle error
	mov rax, 1
	jmp exit

error:
	xor rax, rax
	
exit:
	ret
