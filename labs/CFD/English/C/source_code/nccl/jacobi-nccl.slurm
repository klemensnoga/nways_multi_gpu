#!/bin/bash
#SBATCH --job-name=job_name
#SBATCH --time=01:00:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --gpus-per-task=1
#SBATCH --output="jacobi-nccl-output.log"
#SBATCH --error="jacobi-nccl-output.log"

unset SLURM_EXPORT_ENV 
unset SLURM_MEM_PER_NODE
unset SBATCH_EXPORT

module load nvompic/2023b

export PMIX_MCA_psec=^munge
unset SLURM_CPU_BIND
unset OMPI_MCA_hwloc_base_binding_policy
unset OMPI_MCA_rmaps_base_mapping_policy
#export NCCL_DEBUG=INFO 

# run with 2 GPUs with 2K x 4K grid size
#mpirun -np $SLURM_NTASKS --map-by ppr:2:socket ./jacobi_nccl -nx 2048 -ny 4096

# uncomment for run with 4 GPUs with 4K x 8K grid size
#mpirun -np $SLURM_NTASKS --map-by ppr:4:socket ./jacobi_nccl -nx 4096 -ny 8192

# uncomment for run with 16 GPUs with 4K x 8K grid size
mpirun -np $SLURM_NTASKS --map-by ppr:4:socket ./jacobi_nccl -ny 32768
