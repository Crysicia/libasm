section .text
	global ft_strcmp

ft_strcmp:
	xor	rax, rax
	xor	rbx, rbx
	jmp compare

increment:
	inc rsi
	inc rdi

compare:
	mov al, [rdi]
	cmp al, 0
	jz return_value
	mov bl, [rsi]
	cmp al, bl
	jz	increment

return_value:
	mov al, [rdi]
	mov bl, [rsi]
	sub rax, rbx

exit:
	ret
