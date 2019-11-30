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
	push $greet
	call printf
	add $4, %esp
// ------------------
	push $3
	call print_num
	add $4, %esp
// ------------------
	call write_int
// -----------------
//	call get_input
// -----------------
	call exploit
// -----------------
	xor %eax, %eax
	ret

// print_num:
// printf("%d \n", num)
print_num:
	push %ebp
	movl %esp, %ebp
	push 8(%esp)
	push $format
	call printf
	add $8, %esp
	pop %ebp
	ret

write_int:
	push %ebp
	mov %esp, %ebp
	mov $4, %eax
	mov $1, %ebx
	mov $greet, %ecx
	mov $13, %edx
	int $0x80
	pop %ebp
	ret
// get_input
// scanf("%d", local_var)
get_input:
	push %ebp
	mov %esp, %ebp
	// -------------
	push $input
	call printf
	add $4, %esp
	// -------------
	sub $4, %esp
	push %esp
	push $num_format
	call scanf
	add $8, %esp
	// -------------------
	push $format
	call printf
	// -------------------
	add $8, %esp
	pop %ebp
	ret

exploit:
	push %ebp
	pop %ebp
	ret
