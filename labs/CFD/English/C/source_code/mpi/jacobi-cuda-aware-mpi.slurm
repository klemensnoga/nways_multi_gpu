#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --output="jacobi-cuda-aware-mpi-output.log"
#SBATCH --error="jacobi-cuda-aware-mpi-output.log"

# uncomment if you want to use script outside the Jupyter notebook environment
#module load nvompic/2023b 

export PMIX_MCA_psec=^munge

echo "mpirun:"
mpirun -np $SLURM_NTASKS ./jacobi_cuda_aware_mpi -nx 2048 -ny 4096
# uncomment if you want to see binding information for mpi processes
#mpirun -np $SLURM_NTASKS --report-bindings ./jacobi_cuda_aware_mpi -nx 2048 -ny 4096

# uncomment if you want to use srun instead of mpirun
#echo "srun:"
#srun --ntasks=$SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE --mem-per-cpu=$SLURM_MEM_PER_CPU --cpus-per-task=$SLURM_CPUS_PER_TASK --mpi=pmix  --cpu-bind=cores ./jacobi_cuda_aware_mpi  -nx 2048 -ny 4096
# uncomment if you want to see binding information for srun/mpi processes
#srun --ntasks=$SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE --mem-per-cpu=$SLURM_MEM_PER_CPU --cpus-per-task=$SLURM_CPUS_PER_TASK --mpi=pmix  --cpu-bind=verbose,cores ./jacobi_cuda_aware_mpi  -nx 2048 -ny 4096




