homedir=/home/mspencer/data/autism/veer

max=`wc -l $homedir/controls.csv | cut -f1 -d' '`
sbatch --array=1-$max $homedir/rstables.slurm

# e.g. sbatch --array=1-9 rstables.slurm
