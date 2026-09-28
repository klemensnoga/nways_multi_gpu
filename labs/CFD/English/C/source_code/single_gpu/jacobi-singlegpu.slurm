#!/bin/bash
#SBATCH --time=0:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --gpus=1
#SBATCH --output="jacobi-singlegpu-output.log"
#SBATCH --error="jacobi-singlegpu-output.log"

./jacobi
