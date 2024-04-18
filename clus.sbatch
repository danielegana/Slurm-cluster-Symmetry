# Example slurm script 

#!/bin/bash
#SBATCH --job-name=SR
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --output=/home/degana/SR/logs/SR.out
#SBATCH --time=07:00:00


set -euxo pipefail

pwd
echo "SLURM_JOB_ID=$SLURM_JOB_ID"
date

env OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

module load mathematica

nclus=
filestring="runs/run$nclus.m"

math -noprompt -script $filestring

date
