CC=gcc
CFLAGS= -Wall -std=gnu99 -g -fopenmp
LIBS=src/matrix.c
TUNE= -O2

all: sequential omp omp4 omp9 omp10 omp16 omp25 omp36 omp49 omp56 threadS thread4 thread9 thread10 thread16 thread25 thread36 thread49 thread56 mpi

sequential:
		$(CC) $(TUNE) $(CFLAGS) -o bin/seq $(LIBS) src/sequential.c

omp:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp $(LIBS) src/omp.c

omp4:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp4 $(LIBS) src/omp4.c

omp9:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp9 $(LIBS) src/omp9.c

omp10:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp10 $(LIBS) src/omp10.c

omp16:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp16 $(LIBS) src/omp16.c

omp25:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp25 $(LIBS) src/omp25.c

omp36:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp36 $(LIBS) src/omp36.c				

omp49:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp49 $(LIBS) src/omp49.c

omp56:
		$(CC) $(TUNE) $(CFLAGS) -o bin/omp56 $(LIBS) src/omp56.c

threadS:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/threadS $(LIBS) src/threadS.c

thread4:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread4 $(LIBS) src/thread4.c

thread9:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread9 $(LIBS) src/thread9.c

thread10:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread10 $(LIBS) src/thread10.c

thread16:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread16 $(LIBS) src/thread16.c

thread25:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread25 $(LIBS) src/thread25.c

thread36:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread36 $(LIBS) src/thread36.c

thread49:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread49 $(LIBS) src/thread49.c

thread56:
		$(CC) $(TUNE) $(CFLAGS) -pthread -o bin/thread56 $(LIBS) src/thread56.c

mpi:
		mpicc $(TUNE) $(CFLAGS) -o bin/mpi $(LIBS) src/mpi.c
