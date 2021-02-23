section .text
	global ft_strcmp

ft_strcmp:
	xor	rax, rax
	jmp compare

increment:
	inc rsi
	inc rdi

compare:
	cmp byte [rsi], 0
	jz exit
	cmp byte [rdi], 0
	jz exit
	mov rax, [rdi]
	cmp rax, [rsi]
	jz	increment

exit:
	mov rax, [rdi]
	sub rax, [rsi]
	ret
; section .text
; 	global ft_strcmp

; ft_strcmp:
; 	xor	rax, rax
; 	jmp compare

; increment:
; 	inc rsi
; 	inc rdi

; compare:
; 	cmp	byte [rsi], 0
; 	jz exit
; 	cmp	byte [rdi], 0
; 	jz exit
; 	mov	al, byte [rdi]
; 	sub	al, byte [rsi]
; 	cmp al, byte 0
; 	jz	increment

; exit:
; 	ret
