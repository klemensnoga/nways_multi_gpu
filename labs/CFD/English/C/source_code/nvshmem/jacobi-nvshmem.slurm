#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --ntasks-per-socket=2
#SBATCH --cpus-per-task=16
#SBATCH --gpus=2
#SBATCH --output="jacobi-nvshmem-output.log"
#SBATCH --error="jacobi-nvshmem-output.log"

unset SLURM_EXPORT_ENV 
unset SLURM_MEM_PER_NODE
unset SBATCH_EXPORT

module purge 2> jacobi-nvshmem-compile-output-modules.log
module load nvompic/2021b 2>> jacobi-nvshmem-compile-output-modules.log

export PMIX_MCA_psec=^munge
unset SLURM_CPU_BIND
unset OMPI_MCA_hwloc_base_binding_policy
unset OMPI_MCA_rmaps_base_mapping_policy
export NVSHMEM_HOME=${NVHPC}/Linux_x86_64/22.11/comm_libs/11.8/nvshmem
export MPI_HOME=$EBROOTOPENMPI

# export NVSHMEM_INFO=1
# export NVSHMEM_VERSION=1
# export NVSHMEM_DEBUG=info
# export NVSHMEM_NVTX=all

srun  --mem-per-cpu=$SLURM_MEM_PER_CPU --cpus-per-task=$SLURM_CPUS_PER_TASK --mpi=pmix   ./jacobi_nvshmem $*
#srun  --mem-per-cpu=$SLURM_MEM_PER_CPU --cpus-per-task=$SLURM_CPUS_PER_TASK --mpi=pmix   ./jacobi_nvshmem -nx 2048 -ny 4096
#mpirun -np $SLURM_NTASKS --map-by ppr:2:socket ./left_shift
#mpirun -np $SLURM_NTASKS --map-by ppr:1:socket ./jacobi_nccl -nx 2048 -ny 4096

