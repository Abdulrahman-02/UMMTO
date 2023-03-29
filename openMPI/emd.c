#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    int size, rang;
    MPI_Status s;
    int x,y,succ1,succ2,pred1,pred2;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rang);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // ring pred and succ
    succ1 = (rang + 1) % size;
    succ2 = (rang + 2) % size;
    if (rang == 0){
        pred1 = size - 1;
        pred2 = size - 2;
    }    
    else if(rang == 1){
        pred1 = 0;
        pred2 = size - 1;
    }
    else{
        pred1 = (rang - 1) % size;
        pred2 = (rang - 2) % size;
    }


    printf("1-je suis le processus %d mon succ1= %d et succ2= %d \n", rang, succ1, succ2);
    MPI_Send(&rang, 1, MPI_INT, succ1, 10, MPI_COMM_WORLD);
    MPI_Recv(&x, 1, MPI_INT, pred1, 10, MPI_COMM_WORLD, &s);
    printf("1-Je suis le processus %d, j'ai recu %d de mon pred %d \n", rang, x, pred1);
    MPI_Send(&rang, 1, MPI_INT, succ2, 11, MPI_COMM_WORLD);
    MPI_Recv(&y, 1, MPI_INT, pred2, 11, MPI_COMM_WORLD, &s);
    printf("2-Je suis le processus %d, j'ai recu %d de mon pred %d \n", rang, y, pred2);

    MPI_Finalize();
}
