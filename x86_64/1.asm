bits 64 
global main
extern printf 

segment .rodata
MSG: db "Hello World!", 0x0a
    db 0

segment .text
main:
	; RDI, RSI, RDX, RCX, R8, R9
	mov rdi, MSG
	xor rax, rax
	call printf wrt ..plt
	xor rax, rax
	ret	
