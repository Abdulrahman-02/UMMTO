#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

void main(){
	int i;
	switch (fork()){
	case -1:printf("\n Erreur: Pas de processus crée \n");
		exit(1);
		break;
	case 0:for(i=9;i>-1;i--){
		printf("\n fils ::: \t %d",i);
		sleep(2);
		}
		printf("\n");
		exit(0);
		break;
	default: for(i=0;i<10;i++){
		printf("\n Père ::: \t %d",i);
		sleep(2);
		}
		wait(NULL);
		printf("\n");
		exit(0);
		break;
	}
}
