all: main

main: main.cpp
	g++ $^ -o $@
	objdump -d main > asm.objdump

clean:
	rm -f main

asm: main.cpp
	g++ -S $^ -o $@

.PHONY: all clean
