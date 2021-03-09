SYS_READ equ 0
section .text
	global ft_read
	extern __errno_location

ft_read:
	mov		rax, SYS_READ
	syscall
	cmp		rax, 0
	jge		exit

error:
	push	rbx
	mov		rbx, rax
	neg		rbx
	call	__errno_location wrt ..plt
	mov		[rax], rbx
	pop		rbx
	mov		rax, -1

exit:
	ret
