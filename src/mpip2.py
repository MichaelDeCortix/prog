from sys import argv

from math import sqrt
from mpi4py import MPI
import numpy as np

def readFile(file):
    try:
        return np.genfromtxt(file, dtype=None)
    except: 
        print('Error reading text file, check format',file)
        
comm = MPI.COMM_WORLD
rank, size = comm.Get_rank(), comm.Get_size()

Q = int(sqrt(size))
if int(sqrt(size)) == sqrt(size):
    print('Number of core is not a perfect square')

myrow,   mycol =   int(rank//Q),             int(rank%Q)
rowComm, colComm = comm.Split(myrow, mycol), comm.Split(mycol, myrow)

A = readFile(argv[2])
B = readFile(argv[3])

BuffA = np.copy(A)
BuffB = np.copy(B)
C = np.zeros(A.shape)

start_time = MPI.Wtime()

for k in range(Q):
	tmpA = A if mycol == k else BuffA
	tmpB = B if myrow == k else BuffB

	rowComm.Bcast(tmpA, root=k)
	colComm.Bcast(tmpB, root=k)

	C += np.matmul(tmpA, tmpB)

end_time = MPI.Wtime()

span_times = comm.gather(end_time - start_time, root=0)

if rank == 0:
	print(f'threads:{size} size:{int(argv[1])} time:{round(max(span_times), 4)}')

# with open(f'res\\res-{rank}.dat', 'wb') as f:
# 	np.save(f, C)