#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[])
{

// declaring variables
int size, rank, i;
char msg[50];
MPI_Status s;

// Initialising
MPI_Init(&argc, &argv);
MPI_Comm_size(MPI_COMM_WORLD, &size);
MPI_Comm_rank(MPI_COMM_WORLD, &rank);

// send and receive  
if (rank==0){   //process 0
for ( i = 1; i < size; i++)
{
    MPI_Recv(msg, 50, MPI_CHAR, i, 5, MPI_COMM_WORLD, &s);
    printf("je suis %d, jai recu message= %s \n", rank, msg);
}


} 
else{   //process 1

sprintf(msg, "Bonjour de la part du processus %d", rank);
MPI_Send(msg, strlen(msg) + 1, MPI_CHAR, 0, 5, MPI_COMM_WORLD); // on mit pas l'adress car c'est un tableaux
                                                                //strlen()+1 == 
printf("je suis %d, jenvoie message=%s \n", rank, msg);
}

// finalize
MPI_Finalize();

}
