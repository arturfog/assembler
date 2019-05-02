global main
extern printf 

segment .data
msg db "Hello World!", 0x0a
    db 0

main:
	push msg
	call printf
	add esp, 4
	xor eax, eax
	ret	
