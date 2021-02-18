section .text
global ft_strlen

ft_strlen:
	mov		rax, 0

count:
	inc		rax
	cmp		byte [rdi + rax], 0
	jnz		count

exit:
	ret
