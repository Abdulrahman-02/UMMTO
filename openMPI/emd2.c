#include <stdio.h>
#include <mpi.h>
#include <math.h>

#define N 5
int factorial(int n)
{
    if (n == 0)
        return 1;
    return n * factorial(n - 1);
}
int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    int size;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    int A[N], B[N], V[N];
    int A1, B1, V1, x, y, z, max;

    if (rank == 0)
    {
        x = 3;
        y = 2;
        A[0] = 10;
        A[1] = 20;
        A[2] = 30;
        A[3] = 40;
        A[4] = 50;

        B[0] = 60;
        B[1] = 70;
        B[2] = 80;
        B[3] = 90;
        B[4] = 100;
    }

    MPI_Bcast(&x, 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Bcast(&y, 1, MPI_INT, 0, MPI_COMM_WORLD);

    MPI_Scatter(A, 1, MPI_INT, &A1, 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Scatter(B, 1, MPI_INT, &B1, 1, MPI_INT, 0, MPI_COMM_WORLD);
    
    z = factorial(rank);
    V1 = A1 * x + B1 * y + z;

    printf(" je suis %d , A1= %d B1= %d V1= %d z=%d\n", rank, A1, B1, V1,z);

    // MPI_Gather(&V1, 1, MPI_INT, V, 1, MPI_INT, 0, MPI_COMM_WORLD);
    // MPI_Allreduce(&V1, &max, 1, MPI_INT, MPI_MAX, MPI_COMM_WORLD);
    MPI_Reduce(&V1,&max,1,MPI_INT,MPI_MAX,0,MPI_COMM_WORLD);
    MPI_Bcast(&max, 1, MPI_INT, 0, MPI_COMM_WORLD);
    printf("Je suis process %d La valeur maximale est : %d\n", rank, max);

    MPI_Finalize();

    return 0;
}

