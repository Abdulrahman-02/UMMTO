#include "mpi.h" 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 

int main (int argc, char *argv[]) {
   int size, rang, pred, succ;
   
   MPI_Status s[2];
   MPI_Request r[2]; 
   int x; 
   
   MPI_Init(&argc, &argv); 
   MPI_Comm_rank(MPI_COMM_WORLD, &rang); 
   MPI_Comm_size(MPI_COMM_WORLD, &size); 
   
   // rring pred and succ 
   if (rang == 0) pred = size-1; 
   else pred = rang-1; 
   if (rang == size-1) succ = 0; 
   else succ = rang+1; 
   
   
   printf("1-je suis le processus %d mon pred= %d et succ= %d \n", rang, pred, succ); 

   MPI_Irecv(&x,1,MPI_INT,pred,10,MPI_COMM_WORLD,&r[0]);
   MPI_Isend(&rang,1,MPI_INT,succ,10,MPI_COMM_WORLD,&r[1]);

   MPI_Waitall(2,r,s);
   printf("2-Je suis le processus %d, j'ai recu %d de mon pred %d \n",rang,x,pred);
 
   
   MPI_Finalize(); 
}
