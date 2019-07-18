#!/usr/bin/env bash

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

export OMP_NUM_THREADS=2
#export MV2_ENABLE_AFFINITY=0

cd ./submodules/NormalModes/
source SetEnv
cd demos/
mpirun --allow-run-as-root -np 1 ./../bin/plmvcg_stampede2.out