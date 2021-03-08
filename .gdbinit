set disassemble-next-line on

define dregisters
	display $rax
	display (void *)$rax
	display $rdi
	display (void *)$rdi
	display *(void **)($rdi + 8)
	display $rsi
	display (void *)$rsi
	display *(void **)($rsi + 8)
	display $rdx
	display (void *)$rdx
	display *(void **)($rdx + 8)

	display $rcx
	display (void *)$rcx
	display *(void **)($rcx + 8)
	display $rbx
	display (void *)$rbx
	display *(void **)($rbx + 8)
	display $r10
	display (void *)$r10
	display *(void **)($r10 + 8)
end
