#!/bin/bash -l

#Request 28 cores
#$ -pe omp 28
#$ -l mem_per_core=8G
#$ -l h_rt=08:00:00
#$ -P ct-frstate
#$ -N Flower_Bud_Trinity_job1
#$ -m ae
#$ -o Flower_Bud_Trinity_job1_output
#$ -e Flower_Bud_Trinity_job1_error

# Load modules
module load openmpi/4.1.1
module load miniconda

# Activate Trinity environment
conda activate trinity_2_15_1

# Run Trinity for assembly
mpirun -np 28 Trinity --seqType fq --left /projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_1.cor_val_1.fq --right /projectnb/ct-frstate/studentuser/Flower_Bud_rcorrector_job1_filter/Trim_Galore/unfixrm_Flower_Bud_2.cor_val_2.fq --CPU 28 --max_memory 224G

# Deactivate environment
conda deactivate
