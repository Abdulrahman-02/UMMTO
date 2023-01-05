#include <stdio.h>
#include "mpi.h"

int main(int argc, char *argv[])
{
    int rank, size;
    int x = 0;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int t[size];
    x = rank +1;

    MPI_Allgather(&x, 1, MPI_INT, t, 1, MPI_INT,MPI_COMM_WORLD);

    for (int i = 0; i < size; i++)
    {
        printf(" Je suis le processu %d j'ai recu %d \n", rank, t[i]);
    }

    MPI_Finalize();
}