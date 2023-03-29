#include <stdio.h>
#include "mpi.h"

int main(int argc, char *argv[])
{
    int rank, size;
    int tab[4], tab0[4];
    int x = 0;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == 0)
    {
        tab[0] = 10;
        tab[1] = 20;
        tab[2] = 30;
        tab[3] = 40;
    }

    MPI_Scatter(tab, 1, MPI_INT, &x, 1, MPI_INT, 0, MPI_COMM_WORLD);
    // printf(" je suis %d , jai recu x= %d \n", rank, x);

    MPI_Reduce(tab, &x, 1,MPI_INT, MPI_SUM, 0,MPI_COMM_WORLD);
    
    if (rank == 0)
        {
            // MPI_Reduce(tab, &x, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
            printf(" je suis %d , la somme est x= %d \n", rank, x);
        }
        
        // for (int i = 0; i < 4; i++)
        // {
        //     printf(" je suis %d , la somme est x= %d \n", rank, x);
        // }

    MPI_Finalize();
}