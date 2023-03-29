#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

void main(){
	pid_t f1,f2;
	
	f1 = fork();
	if (f1==0){
	execl("/bin/ls",".ls",NULL);
	}else{
		f2 = fork();
		if(f2==0){
		printf("Fils: Mon PID est %d\n",getpid());
	    	} else{
		wait(NULL);
		wait(NULL);
		printf("Père: Terminé\n");
		exit(0);
		}
	}

	
}
