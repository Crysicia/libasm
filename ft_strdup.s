section .text
	global ft_strdup
	extern malloc

; input		- rsi
; strlen	- rdxinfo regist
; output	- rax
; counter	- rcx

ft_strdup:
	mov		rcx, -1
	mov		rsi, rdi

strlen:
	inc rcx
	cmp byte [rsi + rcx], 0
	jnz strlen
	mov rdx, rcx
	mov rcx, -1

alloc:
	mov rdi, rdx
	inc rdi
	push rsi
	call malloc wrt ..plt
	cmp rax, 0
	jz exit
	xor rdx, rdx
	mov rcx, -1
	pop rsi

copy:
	inc		rcx
	mov		dl, [rsi + rcx]
	mov	 	[rax + rcx], dl
	cmp		dl, 0
	jnz		copy
	mov 	[rax + rcx], byte 0

exit:
	ret
