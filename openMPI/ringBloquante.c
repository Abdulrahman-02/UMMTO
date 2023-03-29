#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    int size, rang, pred, succ;
    MPI_Status s;
    int x;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rang);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // ring pred and succ
    if (rang == 0)
        pred = size - 1;
    else
        pred = rang - 1;
    if (rang == size - 1)
        succ = 0;
    else
        succ = rang + 1;

    printf("1-je suis le processus %d mon pred= %d et succ= %d \n", rang, pred, succ);

    MPI_Send(&rang, 1, MPI_INT, succ, 10, MPI_COMM_WORLD);
    // MPI_Recv(&x, 1, MPI_INT, pred, 10, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    MPI_Recv(&x, 1, MPI_INT, pred, 10, MPI_COMM_WORLD, &s);

    printf("2-Je suis le processus %d, j'ai recu %d de mon pred %d \n", rang, x, pred);

    MPI_Finalize();
}
