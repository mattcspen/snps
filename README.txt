README for Veer SNP data generation

To add controls:
mv controls.csv old_controls.csv


generate_personlist.sh
This looks like the original implementation, which takes an input
of the file of SNPs and iterates through them. Probably the more 
useful one is the gen_rs_table.sh script, which does one SNP per
run of the program.

gen_rs_table.sh
This script assumes the controls.csv file is the one it is looking
at, then takes an input line #, scans that line from the control 
file, then generates the population table using that rs.

setup_snvlists.sh
It looks like this script generates the lists of SNPs for each
microarray, so that the other scripts can identify which set of
people to look through. This shouldn't need to be run again.

1_sbatch.sh
Set up with hard-coded controls.csv file in mind, this will 
launch a slurm array to run gen_rs_table.sh for every line in
the file (via rstables.slurm). This is the main file you want 
to use.
