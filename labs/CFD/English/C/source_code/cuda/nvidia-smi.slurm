#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --account=tutorial
#SBATCH --partition=tutorial
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --gpus=1
#SBATCH --output="nvidia-smi-output.log"
#SBATCH --error="nvidia-smi-output.log"

nvidia-smi topo -p2p r