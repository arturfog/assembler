.extern printf

.section .data
pi_b: .byte 3
pi_w: .word 4
pi_d: .double 1

.section .rodata
format: .asciz "%d \n"
greet: .asciz "Hello World!\n"

.section .text
.global main
main:
	push $greet
	call printf
	add $4, %esp
// ------------------
	call func1
// ------------------
	xor %eax, %eax
	ret

func1:
	push %ebp
	push $2
	push $format
	call printf
	add $8, %esp
	pop %ebp
	ret
