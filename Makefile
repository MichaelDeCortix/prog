CC=gcc
CFLAGS= -Wall -std=gnu99 -g -fopenmp
LIBS=src/matrix.c
TUNE= -O2

all: sequential omp omp2 omp4 omp6 omp8 omp10 omp12 threadS thread2 thread4 thread6 thread8 thread10 thread12 mpi

sequential:
		$(CC) $(TUNE) $(CFLAGS) -o bin/seq $(LIBS) src/sequential.c

omp:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp $(LIBS) src/omp.c

omp2:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp2 $(LIBS) src/omp2.c

omp4:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp4 $(LIBS) src/omp4.c

omp6:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp6 $(LIBS) src/omp6.c

omp8:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp8 $(LIBS) src/omp8.c

omp10:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp10 $(LIBS) src/omp10.c				

omp12:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp12 $(LIBS) src/omp12.c

threadS:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/threadS $(LIBS) src/threadS.c

thread2:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread2 $(LIBS) src/thread2.c

thread4:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread4 $(LIBS) src/thread4.c

thread6:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread6 $(LIBS) src/thread6.c

thread8:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread8 $(LIBS) src/thread8.c

thread10:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread10 $(LIBS) src/thread10.c

thread12:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread12 $(LIBS) src/thread12.c

mpi:
		mpicc $(TUNE) $(CFLAGS) -o bin/mpi $(LIBS) src/mpi.c
