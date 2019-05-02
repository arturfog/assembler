global main
extern printf
extern scanf
extern fopen
extern fclose

segment .data
MODE:		db "rw"
zerobuf:        times 64 db 0

segment .bss
FILENAME:	resb 128

segment .rodata
HELLO:
	db "Hello there !", 0x0a
	db 0

TESTMSG:
	db "Test msg from asm !",0x0a, 0

PROMPT:
	dd "%d",0

segment .text
main:
	push HELLO
	call printf
	add esp, 4

	sub esp, 4
	mov dword [esp], 0x20
	lea eax, [esp]
	push eax
	push PROMPT
	call scanf

	mov eax, [esp + 8]
	push eax
	push PROMPT
	call printf
	add esp, 20

	call open_file

	push TESTMSG
	call write_to_file
	add esp, 4

	call close_file

	xor eax, eax
	ret

write_to_file:
	push ebp
	mov ebp, esp
	pop ebp
	ret

open_file:
	push ebp
	mov ebp, esp
	push MODE
	push FILENAME	
	call fopen
	add esp, 8
	pop ebp
	ret

close_file:
	push ebp
	mov ebp, esp
	;call fclose
	pop ebp
	ret
