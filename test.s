section .text
	global ft_list_sizee

ft_list_sizee:
	xor rax, rax
	mov rbx, [rdi]

count:
	cmp rbx, 0
	je exit
	inc rax
	mov rbx, [rbx + 8]
	jmp count

exit:
	ret
