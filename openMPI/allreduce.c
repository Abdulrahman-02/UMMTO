#include <stdio.h>
#include "mpi.h"

int main(int argc, char *argv[])
{
    int rank, size;
    
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    int x = rank + 1;
    int s = 0;
    MPI_Allreduce(&x,&s,1,MPI_INT,MPI_SUM,MPI_COMM_WORLD);

    printf(" Je suis le processu %d j'ai recu %d \n", rank, s);
    

    MPI_Finalize();
}
