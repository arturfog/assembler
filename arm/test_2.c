#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	int x = 0;
	scanf("%d", &x);
	FILE* fd = fopen("1.asm", "r");
	if(fd) {
		fclose(fd);
	}
	return 0;
}
