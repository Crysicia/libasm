section .text
	global ft_atoi_base

; int ft_atoi_base(char *str, char *base)
ft_atoi_base:
	xor rax, rax
	xor rcx, rcx
	xor rdx, rdx

check_base_loop:
	cmp byte [rsi + rcx + 1], 0
	jz check_base
	mov bl, [rsi + rcx]
	mov bh, [rsi + rcx + 1]
	jmp check_base_loop
	
check_base:
	cmp rax, 1
	jle error

error:
	xor rax, rax
	
exit:
	ret
