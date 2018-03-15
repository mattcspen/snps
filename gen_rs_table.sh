snvref=/home/mspencer/data/autism/genotype/snvref
listdir=/home/mspencer/data/autism/veer/plists
rawdir=/home/mspencer/data/autism/genotype/raw_genotypes
file=/home/mspencer/data/autism/veer/controls.csv

if ! test $# == 1; then
  echo "Specify a line #"
  exit
fi

line=$1
snp=`head -n $line $file | tail -1 | cut -f1 -d,`

listfile=$listdir/"$snp".lst
if [ -f $listfile ]; then exit; fi

grep -q $snp $snvref/1Mv1_snps.txt
if [ "$?" == "0" ]; then
  echo "$snp In 1Mv1"
  m1peeps=`ls $rawdir/1Mv1/*`
  for pfile in ${m1peeps[*]}; do
    info=`grep "$snp\s" $pfile | cut -f 5,6,9`
    name=`basename $pfile | cut -d_ -f1`
    echo -e "$name\t$info" >> $listfile
  done
else
  echo "$snp not in 1Mv1"
fi

grep -q $snp $snvref/1Mv3_snps.txt
if [ "$?" == "0" ]; then
  echo "$snp In 1Mv3"
  m1peeps=`ls $rawdir/1Mv3/*`
  for pfile in ${m1peeps[*]}; do
    info=`grep "$snp\s" $pfile | cut -f 5,6,9`
    name=`basename $pfile | cut -d_ -f1`
    echo -e "$name\t$info" >> $listfile
  done
else
  echo "$snp not in 1Mv3"
fi

grep $snp $snvref/Omni2.5_snps.txt
if [ "$?" == "0" ]; then
  echo "$snp In Omni"
  m1peeps=`ls $rawdir/Omni2.5/*`
  for pfile in ${m1peeps[*]}; do
    info=`grep "$snp\s" $pfile | cut -f 5,6,9`
    name=`basename $pfile | cut -d_ -f1`
    echo -e "$name\t$info" >> $listfile
  done
else
  echo "$snp not in Omni2.5"
fi

echo "Done populating rs table."
