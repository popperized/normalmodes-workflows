#!/usr/bin/env bash
set -e
#SBATCH -J s1p1test
#SBATCH -o s1p1test_%j.txt
#SBATCH -e errs1p1test_%j.err
#SBATCH -p skx-dev
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
##SBATCH -c 4
#SBATCH --export=ALL
#SBATCH --time=2:00:00
#SBATCH -A TG-EAR170019

if [ -z "$OMP_NUM_THREADS" ]; then
  echo "No OMP_NUM_THREADS variable defined"
  exit 1
fi
if [ -z "$MPI_NUM_PROCESSES" ]; then
  echo "No MPI_NUM_ROCESSES variable defined"
  exit
fi

NMBIN="./submodules/NormalModes/bin/plmvcg_popper.out"
cd ./submodules/NormalModes/demos

mpirun -np "$MPI_NUM_PROCESSES" "$NMBIN"
