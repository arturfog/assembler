all: main

main: main.cpp
	g++ $^ -o $@

clean:
	rm -f main

asm: main.cpp
	g++ -S $^ -o $@

.PHONY: all clean