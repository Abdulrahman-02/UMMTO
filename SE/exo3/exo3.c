#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

void main (){

	int i = 0;
	switch(fork()){
	case -1:printf("Erreur: Pas de processus crée \n");
		break;
	case 0:printf("Fils: Valeur initiale:\t%d\n",i);
		i+=100;
		printf("Fils: Nouvelle Valeur:\t%d\n",i);
		printf("\n");
		exit(0);
		break;
	default:printf("Père: Valeur initiale:\t%d\n",i);
		i+=500;
		printf("Père: Nouvelle Valeur:\t%d\n",i);
		wait(NULL);
		exit(0);
		break;		
	}
}
