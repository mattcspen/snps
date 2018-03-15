#!/bin/bash -
#SBATCH -J rstables
#SBATCH -c 1 
#SBATCH -N 1 
#SBATCH -p RC
#SBATCH -t 0-05:00 
#SBATCH -o /home/mspencer/data/autism/veer/logs/%A%a.out # Standard output
# %A" is replaced by the job ID and "%a" with the array index
#SBATCH -e /home/mspencer/data/autism/veer/logs/%A%a.err # Standard error
./gen_rs_table.sh $SLURM_ARRAY_TASK_ID
