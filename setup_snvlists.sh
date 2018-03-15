subdirs=(1Mv1 1Mv3 Omni2.5)
rawdir=/home/mspencer/data/autism/genotype/raw_genotypes
snvdir=/home/mspencer/data/autism/genotype/snvref

rm $snvdir/*_snps.txt

for subdir in ${subdirs[*]}; do
  file=`ls $rawdir/$subdir | head -1`
  tail -n +12 $rawdir/$subdir/$file | cut -f2-4 >> $snvdir/$subdir"_snps.txt"
done
