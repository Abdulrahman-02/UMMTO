#include <stdio.h>
#include "mpi.h"


int main( int argc, char* argv[])
{
    int rank,size;
    int x=0;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank==0) x=2; //seulment rang 0 recoie
    
    printf("1: je suis %d, x= %d \n",rank,x);

    MPI_Bcast(&x, 1, MPI_INT, 0, MPI_COMM_WORLD);

    printf(" je suis %d , jai recu x= %d \n", rank, x);

    MPI_Finalize();
}