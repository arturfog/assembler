.extern printf
.section .rodata
	greet: .asciz "Hello World !\n"

.section .text
.global main
main:
	push {lr}
	mov %r1, #5
	ldr %r0, =$greet
	bl printf
//--------------------
	bl func1
//--------------------
// exit
	pop {lr}
	bx lr

func1:
	push {lr}
	ldr %r0, =$greet
	bl printf
	pop {lr}
	bx lr

