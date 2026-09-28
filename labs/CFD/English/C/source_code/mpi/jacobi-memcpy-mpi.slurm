#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --output="jacobi-memcpy-mpi-output.log"
#SBATCH --error="jacobi-memcpy-mpi-output.log"

export PMIX_MCA_psec=^munge
unset SLURM_CPU_BIND 

srun --ntasks=$SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE --mem-per-cpu=$SLURM_MEM_PER_CPU --cpus-per-task=$SLURM_CPUS_PER_TASK --mpi=pmix ./jacobi_memcpy_mpi -nx 2048 -ny 4096

