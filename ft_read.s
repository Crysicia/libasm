SYS_READ equ 0
extern __errno_location
section .text
	global ft_read

ft_read:
	mov	rax, SYS_READ
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
