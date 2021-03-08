section .text
	global ft_list_swap

ft_list_swap:
	mov rax, [rdx + 8]
	mov [rsi + 8], rax
	mov [rdx + 8], rsi
	mov [rdi + 8], rdx

exit:
	ret
