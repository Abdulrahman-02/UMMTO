#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char *argv[]) {
  // Initialize MPI
  MPI_Init(&argc, &argv);

  // Get the number of processes and the rank of this process
  int num_procs, rank;
  MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  // Calculate the number of points to generate in this process
  long long num_points = 100000000 / num_procs;

  // Generate random points in the unit square
  int i;
  long long count = 0;
  double x, y;
  for (i = 0; i < num_points; i++) {
    x = (double)rand() / RAND_MAX;
    y = (double)rand() / RAND_MAX;

    // Check if the point lies inside the unit circle
    if (x * x + y * y <= 1) {
      count++;
    }
  }

  // Use MPI_Reduce to sum the counts from all processes
  long long total_count;
  MPI_Reduce(&count, &total_count, 1, MPI_LONG_LONG, MPI_SUM, 0,
             MPI_COMM_WORLD);

  // Calculate the value of Pi on the root process
  if (rank == 0) {
    double pi = (double)total_count / (num_points * num_procs) * 4;
    printf("The value of Pi is approximately %.16f\n", pi);
  }

  // Finalize MPI
  MPI_Finalize();

  return 0;
}
