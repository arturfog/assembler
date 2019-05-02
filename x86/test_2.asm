	.file	"test_2.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"r"
.LC2:
	.string	"1.asm"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	mov	ebp, esp
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	sub	esp, 32
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, ecx
	mov	eax, DWORD PTR 4[eax]
	mov	DWORD PTR -28[ebp], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	mov	DWORD PTR -20[ebp], 0
	sub	esp, 8
	lea	eax, -20[ebp]
	push	eax
	lea	eax, .LC0@GOTOFF[ebx]
	push	eax
	call	__isoc99_scanf@PLT
	add	esp, 16
	sub	esp, 8
	lea	eax, .LC1@GOTOFF[ebx]
	push	eax
	lea	eax, .LC2@GOTOFF[ebx]
	push	eax
	call	fopen@PLT
	add	esp, 16
	mov	DWORD PTR -16[ebp], eax
	cmp	DWORD PTR -16[ebp], 0
	je	.L2
	sub	esp, 12
	push	DWORD PTR -16[ebp]
	call	fclose@PLT
	add	esp, 16
.L2:
	mov	eax, 0
	mov	edx, DWORD PTR -12[ebp]
	xor	edx, DWORD PTR gs:20
	je	.L4
	call	__stack_chk_fail_local
.L4:
	lea	esp, -8[ebp]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	lea	esp, -4[ecx]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB7:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE7:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
