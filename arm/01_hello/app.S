.extern printf
.extern scanf

.section .data
pi_b: .byte 3
pi_w: .word 4
pi_d: .double 1

.section .rodata
format: .asciz "%d \n"
num_format: .asciz "%d"
greet: .asciz "Hello World!\n"
input: .asciz "Please type number:"

.section .text
.global main
main:
	push {lr}
	ldr %r0, =$greet
	mov %r1, #5
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
// print_num:
// printf("%d \n", num)
print_num:
	push {lr]
	bl printf
	pop {lr}
	bx lr

write_int:
	push {lr]
	pop {lr}
	bx lr
// get_input
// scanf("%d", local_var)
get_input:
	push {lr]
	pop {lr}
	ldr %r0, =$input
	bl printf
	ldr %r0, =$format
	bl printf
	bx lr

exploit:
	push {lr}
	pop {lr}
	bx lr
