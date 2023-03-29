#include <stdio.h>
#include <mpi.h>
#include <math.h>

#define N 5

int main(int argc, char **argv)
{
    // Initialisation de MPI
    MPI_Init(&argc, &argv);

    // Récupération du rang du processus
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // Récupération du nombre de processus
    int size;
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // Initialisation des tableaux A, B et V + les variables
    int A[N], B[N], V[N];
    int A1,B1,V1,x,y,z;

    // Si le processus est le maître (rang 0)
    if (rank == 0)
    {
        x=3;y=2;z=5;
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
    
    MPI_Bcast(&x,1,MPI_INT,0,MPI_COMM_WORLD);
    MPI_Bcast(&y, 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Bcast(&z, 1, MPI_INT, 0, MPI_COMM_WORLD);

    MPI_Scatter(A, 1, MPI_INT, &A1, 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Scatter(B, 1, MPI_INT, &B1, 1, MPI_INT, 0, MPI_COMM_WORLD);


    V1=A1*x+B1*y+z;

    printf(" je suis %d , A1= %d B1= %d V1= %d \n", rank,A1,B1,V1);

    MPI_Gather(&V1,1,MPI_INT,V,1,MPI_INT,0,MPI_COMM_WORLD);

    if(rank==0){
        printf("V =[%d,%d,%d,%d,%d]", V[0], V[1], V[2], V[3], V[4]);
    }

    // Finalisation de MPI
    MPI_Finalize();

    return 0;
}