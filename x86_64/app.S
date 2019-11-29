.extern printf 

.section .rodata
	MSG: .asciz "Hello World! %d %d\n"

.section .text
.global main
main:
	// RDI, RSI, RDX, RCX, R8, R9
	xor %rax, %rax
	mov $MSG, %rdi
	mov $123, %rsi
	mov $19, %rdx
	call printf@PLT
	xor %rax, %rax
	ret	
