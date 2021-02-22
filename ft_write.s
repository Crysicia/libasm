SYS_WRITE equ 1
extern __errno_location
section .text
	global ft_write

ft_write:
	mov	rax, SYS_WRITE
	syscall
	cmp	rax, 0
	jge	exit

error:
	push rbx
	mov	rbx, rax
	neg rbx
	call __errno_location wrt ..plt
	mov [rax], rbx
	pop rbx
	mov rax, -1

exit:
	ret
