1.o: 1.asm
	nasm -g -f elf64 -o $@ $^
1.elf: 1.o
	gcc -g -s $^ -o $@
2.o: 2.asm
	nasm -g -f elf64 -o $@ $^
2.elf: 2.o
	gcc -O0 -g -s $^ -o $@
test_2.asm: test_2.c
	gcc -S -masm=intel $^ -o $@
