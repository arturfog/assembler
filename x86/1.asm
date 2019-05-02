global main
extern printf 

segment .rodata
MSG: db "Hello World!", 0x0a
     db 0

segment .text
main:
	push MSG
	call printf
	add esp, 4
	xor eax, eax
	ret	
