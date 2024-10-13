#!/bin/bash -l

#Request 28 cores
#$ -pe omp 28
#$ -l mem_per_core=8G
#$ -l h_rt=01:00:00
#$ -P ct-frstate
#$ -N Flower_Bud_Busco_job1
#$ -m ae
#$ -o Flower_Bud_Busco_job1_output
#$ -e Flower_Bud_Busco_job1_error

# Load modules
module load openmpi/3.1.4
module load miniconda
module load blast+
module load hmmer
module load augustus
module load busco

# Activate BUSCO environment
conda activate busco_5_4_7

# Set path for Augustus
export AUGUSTUS_CONFIG_PATH=/projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_cor_val_trinityjob1/trinity_out_dir/bowtie2index_job1/BUSCO

# Run BUSCO for transcriptome assessment
run_BUSCO.py -c 28 -m transcriptome -i /projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_cor_val_trinityjob1/trinity_out_dir/Trinity.fasta -o /projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_cor_val_trinityjob1/trinity_out_dir/bowtie2index_job1/BUSCO -l eudicots_odb10

# Deactivate environment
conda deactivate
