#!/bin/bash
echo
if [ ! -f data/mat_5_4.txt ]; then
    echo "generate 5x4 matrix..."
    python random_float_matrix.py 5 4 > data/mat_5_4.txt
fi

if [ ! -f data/mat_4_5.txt ]; then
    python random_float_matrix.py 4 5 > data/mat_4_5.txt
fi

if [ ! -f data/mat_100x100.txt ]; then
    echo "generate 100x100 matrix..."
    python random_float_matrix.py 100 100 > data/mat_100x100.txt
fi

if [ ! -f data/mat_100x100b.txt ]; then
    python random_float_matrix.py 100 100 > data/mat_100x100b.txt
fi

if [ ! -f data/mat_1000x1000.txt ]; then
    echo "generate 1000x1000 matrix..."
    python random_float_matrix.py 1000 1000 > data/mat_1000x1000.txt
fi
if [ ! -f data/mat_1000x1000b.txt ]; then
    python random_float_matrix.py 1000 1000 > data/mat_1000x1000b.txt
fi


if [ ! -f data/mat_2000x2000a.txt ]; then
    echo "generate 2000x2000 matrix..."
    python random_float_matrix.py 2000 2000 > data/mat_2000x2000a.txt
fi
if [ ! -f data/mat_2000x2000b.txt ]; then
    python random_float_matrix.py 2000 2000 > data/mat_2000x2000b.txt
fi

echo "calculate..."
echo
echo "100x100 Matrix"
cal_t=$((time bin/seq data/mat_100x100.txt data/mat_100x100b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with sequential    $cal_t"

cal_t=$((time bin/omp9 data/mat_100x100.txt data/mat_100x100b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with omp           $cal_t"

cal_t=$((time bin/thread9 data/mat_100x100.txt data/mat_100x100b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with Phtreads      $cal_t"

cal_t=$((time mpirun -np 9 bin/mpi data/mat_100x100.txt data/mat_100x100b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with mpi           $cal_t"

cal_t=$((time mpiexec -n 9 python3 src/mpip2.py 100 data/mat_100x100.txt data/mat_100x100b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with mpi4p         $cal_t"
echo

echo "1000x1000 Matrix"
cal_t=$((time bin/seq data/mat_1000x1000.txt data/mat_1000x1000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with sequential    $cal_t"

cal_t=$((time bin/omp9 data/mat_1000x1000.txt data/mat_1000x1000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with omp           $cal_t"

cal_t=$((time bin/thread9 data/mat_1000x1000.txt data/mat_1000x1000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with Phtreads      $cal_t"

cal_t=$((time mpirun -np 9 bin/mpi data/mat_1000x1000.txt data/mat_1000x1000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with mpi           $cal_t"

cal_t=$((time mpiexec -n 9 python3 src/mpip2.py 1000 data/mat_1000x1000.txt data/mat_1000x1000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with mpi4p         $cal_t"
echo

echo "2000x2000 Matrix"
cal_t=$((time bin/seq data/mat_2000x2000a.txt data/mat_2000x2000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with sequential    $cal_t"

cal_t=$((time bin/omp9 data/mat_2000x2000a.txt data/mat_2000x2000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with omp           $cal_t"

cal_t=$((time bin/thread9 data/mat_2000x2000a.txt data/mat_2000x2000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with Phtreads      $cal_t"

cal_t=$((time mpirun -np 9 bin/mpi data/mat_2000x2000a.txt data/mat_2000x2000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with mpi           $cal_t"

cal_t=$((time mpiexec -n 9 python3 src/mpip2.py 2000 data/mat_2000x2000a.txt data/mat_2000x2000b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
echo "with mpi4p         $cal_t"
echo

