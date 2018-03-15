snvref=/home/mspencer/data/autism/genotype/snvref
listdir=/home/mspencer/data/autism/veer/plists
rawdir=/home/mspencer/data/autism/genotype/raw_genotypes

tim=`date +%H%M`
touch "$rawdir/_$tim"

if ! test $# == 1; then
  echo "Specify a snp file"
  exit
fi

file=$1
snps=`cut -f1 -d, $file`
echo $snps

for snp in ${snps[*]}; do
  listfile=$listdir/"$snp".lst
  if [ -f $listfile ]; then rm $listfile; fi

  grep -q $snp $snvref/1Mv1_snps.txt
  if [ "$?" == "0" ]; then
    echo "$snp In 1Mv1"
    m1peeps=`ls $rawdir/1Mv1/*`
    for pfile in ${m1peeps[*]}; do
      info=`grep "$snp\s" $pfile | cut -f 5,6,9`
      name=`basename $pfile | cut -d_ -f1`
      echo -e "$name\t$info" >> $listfile
    done
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
  fi
done

