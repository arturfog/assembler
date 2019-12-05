#include <windows.h>
#include <stdio.h>
int main(int argc, char* argv[]) {
	//printf("Hello World!");
	HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
	DWORD byteswritten;
	WriteConsole(h, "WriteConsole", 12, &byteswritten, NULL);
	WriteFile(h, "WriteFile", 9, &byteswritten, NULL);
	return 0;
}
