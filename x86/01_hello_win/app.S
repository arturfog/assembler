.extern _printf
.extern _scanf
.extern _WriteConsoleA@20
.extern _GetStdHandle@4
.section .data
pi_b: .byte 3
pi_w: .word 4
pi_d: .double 1
handle: .double 0
.section .rodata
format: .asciz "You entered: %d \n\r"
num_format: .asciz "%d"
greet: .asciz "Hello World!\n"
greet2: .asciz "Eello World!\n"
input: .asciz "Please type number:"

.section .text
.global _main
_main:
	push %ebp
	mov %esp, %ebp
	push $greet
	call _printf
	add $4, %esp
	// ------------------
	push $3
	call print_num
	add $4, %esp
	// -----------------
	call write_int
	// -----------------
	//call get_input
	// -----------------
	call exploit
	// -----------------
	pop %ebp
	ret

// print_num:
// printf("%d \n", num)
print_num:
	push %ebp
	movl %esp, %ebp
	push 8(%esp)
	push $format
	call _printf
	add $8, %esp
	pop %ebp
	ret

write_int:
	push %ebp
	mov %esp, %ebp
	sub $4, %esp
	call ___main
	push $0xfffffff5
	call _GetStdHandle@4
	add $4, %esp
	movl %eax, handle

	push $0x0
	lea pi_d, %eax
	push %eax
	push $13
	push $greet2
	push handle
	call _WriteFile@20
	
	add $0x10, %esp
	xor %eax, %eax
	
	pop %ebp
	ret

// get_input
// scanf("%d", local_var)
get_input:
	push %ebp
	mov %esp, %ebp
	// -------------
	push $input
	call _printf
	add $4, %esp
	// -------------
	sub $4, %esp
	push %esp
	push $num_format
	call _scanf
	add $8, %esp
	// -------------------
	push $format
	call _printf
	// -------------------
	add $8, %esp
	pop %ebp
	ret

exploit:
	push %ebp
	pop %ebp
	ret
