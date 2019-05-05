TOOLCHAIN_PATH='/home/artur/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/'
1.o: 1.asm
	${TOOLCHAIN_PATH}/arm-linux-androideabi-as -g -o $@ $^
1.elf: 1.o
	${TOOLCHAIN_PATH}/arm-linux-androideabi-gcc -g -s $^ -o $@
