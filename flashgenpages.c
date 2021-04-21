#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int i, j;

	for (i = 0; i <= 126742; i += 16){
		printf("https://www.kongregate.com/games?pdis=b0-e&sort=oldest&srid=%d\n", i);
	}

	return 0;
}
