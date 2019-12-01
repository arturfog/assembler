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
	ldr r0, =$greet
	mov r1, #5
	bl printf
//--------------------
	bl func1
//--------------------
	mov r0, #25
	bl print_num
//--------------------
	bl write_int
//--------------------
	bl get_input
//--------------------
// exit
	pop {lr}
	bx lr

func1:
	push {lr}
	ldr r0, =$greet
	bl printf
	pop {lr}
	bx lr
// print_num:
// printf("%d \n", num)
print_num:
	push {fp,lr}
	mov r1, r0
	ldr r0, =$format
	bl printf
	pop {fp,lr}
	bx lr

write_int:
	push {fp,lr}
	mov r7, #4 // write
	mov r0, #1 // stdout
	ldr r1, =$greet
	mov r2, #13
	swi 0x0
	pop {fp,lr}
	bx lr

// get_input
// scanf("%d", local_var)
get_input:
	push {fp,lr}

	ldr r0, =$input
	bl printf

	sub sp, #4
	mov r1, sp
	ldr r0, =$num_format
	bl scanf

	ldr r0, =$format
	ldr r1, [sp]
	bl printf

	add sp, #4
	pop {fp,lr}
	bx lr

exploit:
	push {lr}
	pop {lr}
	bx lr
