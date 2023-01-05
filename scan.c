#include <stdio.h>
#include "mpi.h"

int main(int argc, char *argv[])
{
    int rank, size;
    int send,recv;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);


    send=rank+1;

    MPI_Scan(&send,&recv,1,MPI_INT,MPI_SUM,MPI_COMM_WORLD);
    printf(" Je suis le processu %d j'ai recu %d \n", rank,recv);
    MPI_Finalize();
}