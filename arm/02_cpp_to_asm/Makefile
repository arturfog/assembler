CXX=arm-linux-gnueabi-g++

all: main

main: main.cpp
	$(CXX) $^ -o $@
	arm-linux-gnueabi-objdump -d main > asm.objdump
clean:
	rm -f main

asm: main.cpp
	$(CXX) -S $^ -o $@

.PHONY: all clean
