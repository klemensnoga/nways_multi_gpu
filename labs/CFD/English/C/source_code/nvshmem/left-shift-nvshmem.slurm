#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --ntasks-per-socket=2
#SBATCH --cpus-per-task=16
#SBATCH --gpus-per-task=1
#SBATCH --output="left-shift-nvshmem-output.log"
#SBATCH --error="left-shift-nvshmem-output.log"

unset SLURM_EXPORT_ENV 
unset SLURM_MEM_PER_NODE
unset SBATCH_EXPORT

module purge 2> left-shift-nvshmem-compile-output-modules.log
module load nvompic/2021b 2>> left-shift-nvshmem-compile-output-modules.log

export PMIX_MCA_psec=^munge
unset SLURM_CPU_BIND
unset OMPI_MCA_hwloc_base_binding_policy
unset OMPI_MCA_rmaps_base_mapping_policy
export NVSHMEM_HOME=${NVHPC}/Linux_x86_64/22.11/comm_libs/11.8/nvshmem
export MPI_HOME=$EBROOTOPENMPI

# for 4 GPUs on node or less
#mpirun -np $SLURM_NTASKS --map-by ppr:2:socket ./left_shift
# for 4 GPUS on node or more
mpirun -np $SLURM_NTASKS --map-by ppr:4:socket ./left_shift

