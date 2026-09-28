#!/bin/bash
#SBATCH --time=0:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --gpus=2
#SBATCH --output="jacobi-memcpy-profiling-output.log"
#SBATCH --error="jacobi-memcpy-profiling-output.log"

nsys profile --trace=cuda,nvtx --stats=true -o jacobi_memcpy_report --force-overwrite true ./jacobi_memcpy
