section .text
	global ft_strcmp

ft_strcmp:
	xor	rax, rax
	jmp compare

increment:
	inc rsi
	inc rdi

compare:
	cmp byte [rdi], 0
	jz return_value
	mov rax, [rdi]
	cmp rax, [rsi]
	jz	increment

return_value:
	mov rax, [rdi]
	sub rax, [rsi]

exit:
	ret
