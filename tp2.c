#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{

    int size, rank, source;
    MPI_Status s;
    int taille = 100;
    char message[taille];
    char buff[taille];
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank != 0)
    {
        MPI_Buffer_attach(message, taille);
        sprintf(message, "bonjour de la part %d \n", rank);
        MPI_Bsend(buff, strlen(message) + 1, MPI_CHAR, 0, 1, MPI_COMM_WORLD);
    
    }
    else{
        for(source=1;source<size;source++){
            MPI_Recv(message,100,MPI_CHAR,source,1,MPI_COMM_WORLD,&s);
            printf("je suis %d,jai recu message: %s \n",rank,message);
            MPI_Buffer_detach(buff,taille);
            }
    }
}