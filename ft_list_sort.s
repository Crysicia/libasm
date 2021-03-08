section .text
	global ft_list_sort

ft_list_sort:
	xor		rcx, rcx
	xor		r10, r10
	mov		r8, 1

check_error:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	mov		rbx, [rdi]
	cmp		rbx, 0
	je		exit
	jmp		sort

sort:
	cmp		r8, 0
	je		exit
	xor		r8, r8
	mov		r10, [rdi]
	mov		rbx, [rdi]
	mov		rcx, [rbx + 8]
	; xor		r10, r10
	; mov		rbx, [rdi]
	; mov		rcx, [rbx + 8]

sort_loop:
	cmp		rcx, 0
	je		sort
	push	rdi
	push	rsi
	push	rcx
	push	rbx
	push	r8
	mov		r8, rsi
	mov		rdi, [rbx]
	mov		rsi, [rcx]
	call	r8
	pop		r8
	pop		rbx	
	pop		rcx
	pop		rsi
	pop		rdi
	cmp		rax, 0
	jge		swap

increment_loop:
	mov		r10, rbx
	mov		rbx, rcx
	mov		rcx, [rcx + 8]
	jmp		sort_loop

swap:
	mov		r8, 1
	mov		rax, [rcx + 8]
	mov		[rbx + 8], rax
	mov     [rcx + 8], rbx
	cmp		rbx, [rdi]
	je		update_head
	mov		[r10 + 8], rcx
	jmp		swap_registers


update_head:
	mov		[rdi], rcx

swap_registers:
	; mov rax, rbx
	; mov rbx, rcx
	; mov rcx, rax
	jmp		increment_loop

exit:
	ret


; def bub_sort_linkchange(self):
;     end = None
;     while end != self.start_node:
;         previous = self.start_node
;         current = self.start_node
;         while current.next != end:
;             next = current.next
;             if current.item > next.item:
;                 current.next = next.next
;                 next.next = current
;                 if current != self.start_node:
;                     previous.next = next
;                 else:
;                     self.start_node = next
;                 temp = current
;                 current = next
;                 next = temp
;             previous = current
;             current = current.next
;         end = current
; https://stackabuse.com/sorting-and-merging-single-linked-list/
; [rdi] == HEAD
; r10 == previous
; rbx == current
; rcx == next
; rsi == cmp
; r8 == sorted?


; while not sorted
; 	current = HEAD
; 	next = current
; 	while next
; 		next = current.next
; 		if next.data < current.data
; 			current.next = next.next
; 			next.next = current
; 			sorted = false
