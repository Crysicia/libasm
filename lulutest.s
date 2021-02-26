section .text
	global lulutest

lulutest:
	cmp rdi, 42
	cmove r8, byte 0
	cmovg r8, byte 1
	cmovl r8, byte -1
	mov rax, rbx
	ret
