.extern printf
.extern scanf

.section .data
pi_b: .byte 3
pi_w: .word 4
pi_d: .double 1
pi_q: .quad 5

.section .rodata
format: .asciz "%d \n"
num_format: .asciz "%d"
MSG: .asciz "Hello World %d %d!\n"
greet: .asciz "Hello World!\n"
input: .asciz "Please type number:"

.section .text
.global main
main:
	// RDI, RSI, RDX, RCX, R8, R9
	xor %rax, %rax
	mov $MSG, %rdi
	mov $123, %rsi
	mov $19, %rdx
	call printf@PLT
// ------------------
	mov $3, %rdi
	call print_num
// ------------------
	call write_int
// -----------------
	call get_input
// -----------------
	call exploit
// -----------------
	xor %rax, %rax
	ret

// print_num:
// printf("%d \n", num)
print_num:
	push %rbp
	mov %rsp, %rbp
	xor %rax, %rax
	mov %rdi, %rsi
	mov $format, %rdi
	call printf@PLT
	pop %rbp
	ret

write_int:
	push %rbp
	mov %rsp, %rbp
	mov $4, %eax
	mov $1, %ebx
	mov $greet, %ecx
	mov $13, %edx
	int $0x80
	pop %rbp
	ret
// get_input
// scanf("%d", local_var)
get_input:
	push %rbp
	mov %rsp, %rbp
	// ------------
	xor %rax, %rax
	mov $input, %rdi
	call printf@PLT
	// -------------
	xor %rax, %rax
	sub $8, %rsp
	mov %rsp, %rsi
	mov $num_format, %rdi
	call scanf@PLT
	// -------------
	mov (%rsp), %rsi
	mov $format, %rdi
	xor %rax, %rax
	call printf@PLT
	add $8, %rsp
	// -------------------
	pop %rbp
	ret

exploit:
	push %rbp
	pop %rbp
	ret
