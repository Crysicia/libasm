section .text
	global ft_list_size

ft_list_size:
	xor		rax, rax

count:
	cmp		rdi, 0
	je		exit
	inc		rax
	mov		rdi, [rdi + 8]
	jmp		count

exit:
	ret
