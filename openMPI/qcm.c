#include <mpi.h>
#include <stdio.h>

int rank;
int size;
int somme = 0;
int somme1 = 0; // somme partielle
int i;
#define max_iter 100

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    for (i = rank * max_iter / size; i < (rank + 1) * max_iter / size; i++)
    {
        somme1 += i;
    }

    printf("Je suis %d, ma somme1 est : %d\n", rank, somme1);

    MPI_Reduce(&somme1, &somme, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

    if (rank == 0)
        printf("Je suis %d, la somme reçue est : %d\n", rank, somme);

    /* Vérification du résultat */
    if (rank == 0)
        printf("Somme attendue= %d \n", ((max_iter - 1) * max_iter) / 2);

    MPI_Finalize();
    return 0;
}
