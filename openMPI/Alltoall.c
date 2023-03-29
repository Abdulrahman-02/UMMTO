#include <stdio.h>
#include "mpi.h"

int main(int argc, char *argv[])
{
    int rank, size;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int my_values[size];
    for (int i = 0; i < size; i++)
    {
        my_values[i] = rank *4 + i + 1;
    }
    
    for (int i = 0; i < size; i++)
    {
        printf(" Je suis le processu %d mon tableaux est %d \n", rank, my_values[i]);
    }

    int buffer_recv[size];

    MPI_Alltoall(my_values, 1, MPI_INT, buffer_recv, 1, MPI_INT, MPI_COMM_WORLD);
    for (int i = 0; i < size; i++)
    {
         printf(" Je suis le processu %d j'ai recu %d \n", rank, buffer_recv[i]);
    }

    MPI_Finalize();
}