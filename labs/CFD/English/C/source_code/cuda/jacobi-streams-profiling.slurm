#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --gpus=2
#SBATCH --output="jacobi-streams-profiling-output.log"
#SBATCH --error="jacobi-streams-profiling-output.log"

nsys profile --trace=cuda,nvtx --stats=true -o jacobi_streams_p2p_report --force-overwrite true ./jacobi_streams -p2p