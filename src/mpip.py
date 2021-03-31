from mpi4py import MPI
import numpy as np
import argparse 
import sys

def output(mat_p, result):
    if rank == 0:
        size = mat_p[0] * mat_p[3]
        i = 0
        while i < size:
            print(final_matrix[i])
            i++
            if i % mat_p[3] == 0:
                print('\n')

def parseOptions(comm):
    parser = argparse.ArgumentParser(
        description='Print some messages.')

    parser.add_argument('m1_path', help='How many times', type=str)
    parser.add_argument('m2_path', help='How many times', type=str)

    args = None
    try:
        if comm.Get_rank() == 0:
            args = parser.parse_args()
    finally:
        args = comm.bcast(args, root=0)

    if args is None:
        exit(0)
    return args

def readFile(file):
    try:
        #lines = [re.sub(' +', ' ',line.rstrip('\n').rstrip()).lstrip() for line in open(file)]
        return np.genfromtxt(file, dtype=None)
    except: 
        print('Error reading text file, check format',file)

def multiply(comm,m_1,m_2):
    
    
def main():
    comm=MPI.COMM_WORLD
    rank=comm.Get_rank()
    size=comm.Get_size()
    args = parseOptions(comm)
    
    PyObject *m_a
    PyObject *m_b
    PyObject *final_matrix
    
    if rank == 0:
        m_1 = readFile(args.m1_path)
        m_2 = readFile(args.m1_path)
        
        matrix_properties = []
        matrix_properties.append(len(m_1))
        matrix_properties.append(len(m_1[0]))
        matrix_properties.append(len(m_2))
        matrix_properties.append(len(m_2[0]))
        
        m_a = m_1.flatten()
        m_b = m_2.flatten()
        
    comm.bcast([matrix_properties, 4, MPI_INT], root=0)
        
    size_a   = matrix_properties[0] * matrix_properties[1]
    size_b   = matrix_properties[2] * matrix_properties[3]
    size_res = matrix_properties[0] * matrix_properties[3]
    
    if rank == 0:
        final_matrix = malloc(size_res * sys.getsizeof(float))
    else:
        m_a = malloc( size_a * sys.getsizeof(float))
        m_b = malloc( size_b * sys.getsizeof(float))
    
    comm.bcast([m_a, size_a , MPI_DOUBLE], root=0)
    comm.bcast([m_b, size_b , MPI_DOUBLE], root=0)

    startrow = rank * ( matrix_properties[0] / size)
    endrow = ((rank + 1) * ( matrix_properties[0] / size)) -1
    
    number_of_rows = size_res / num_worker
    PyObject *result_matrix = calloc(number_of_rows, sys.getsizeof(float))
    
    int position = 0;
    
    for int i = startrow; i <= endrow; i++) {
        for (int j = 0; j < matrix_properties[3]; j++) {
            for (int k = 0; k < matrix_properties[2]; k++) {
                result_matrix[position] +=
                    m_a[ (i * matrix_properties[1] + k) ] *
                    m_b[ (k * matrix_properties[3] + j) ];
            }
            position++;
        }
    }
    
    for i in range(startrow, endrow):
        for i in range(startrow, endrow):
    
    output(matrix_properties, result)
    
if __name__ == '__main__':
    main()