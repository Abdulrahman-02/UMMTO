#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
void main(){
	printf("-> Premier test de fork()...\n");
	printf("-> Code rendu par le fork: %d\n",fork());
	printf("-> Numéro du processus recupere: %d\n", getpid());
	exit(0);
}
