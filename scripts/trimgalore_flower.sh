#!/bin/bash -l

#Request 4 cores
#$ -pe omp 4
#$ -l h_rt=00:30:00
#$ -P ct-frstate
#$ -N Flower_Bud_Trim_job1
#$ -m ae
#$ -o Flower_Bud_Trim_job1_output
#$ -e Flower_Bud_Trim_job1_error

# Load modules
module load openmpi/3.1.4
module load miniconda

# Activate TrimGalore environment
conda activate Trim_Galore_0_6_10

# Run TrimGalore for paired-end reads
perl /projectnb/ct-frstate/studentuser/.conda/envs/Trim_Galore_0_6_10/bin/trim_galore --paired --retain_unpaired --length 36 --stringency 1 -e 0.1 --fastqc /projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_1.cor.fq /projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_2.cor.fq

# Deactivate environment
conda deactivate
