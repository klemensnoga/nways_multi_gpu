#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --output="jacobi-nccl-long-output.log"
#SBATCH --error="jacobi-nccl-long-output.log"

# uncomment if you want to use script outside the Jupyter notebook environment
#module load nvompic/2023b 

export PMIX_MCA_psec=^munge

# uncomment if you want to use NCCL_DEBUG=INFO for more information
#export NCCL_DEBUG=INFO 

echo "mpirun:"
mpirun -np $SLURM_NTASKS  ./jacobi_nccl --nx 2048 -ny 4096  -niter 5000
