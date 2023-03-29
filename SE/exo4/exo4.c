#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

void main(){
	pid_t f;
	f = fork();
	
	switch(f){
	case -1:printf("Erreur: Pas de création de processus");
		break;
	case 0:execl("/home/abdou/Documents/SE/exo4/f1","./f1",NULL);
		printf("Erreur");
		exit(0);
		break;
	default:wait(NULL);
		printf("Père: Terminé");
		exit(0);
	}
	
}
