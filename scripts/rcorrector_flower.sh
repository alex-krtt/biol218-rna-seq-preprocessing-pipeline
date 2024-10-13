#!/bin/bash -l

#Request 28 cores
#$ -pe omp 28
#$ -l h_rt=00:20:00
#$ -P ct-frstate
#$ -N Flower_Bud_rcorrector_job1
#$ -m ae
#$ -o Flower_Bud_rcorrector_job1_output
#$ -e Flower_Bud_rcorrector_job1_error

# Load modules
module load openmpi/3.1.4
module load miniconda

# Activate rCorrector environment
conda activate rcorrector_1_0_5

# Run rCorrector
perl /projectnb/ct-frstate/professor/.conda/envs/rcorrector_1_0_5/bin/run_rcorrector.pl -t 28 -1 /project/ct-frstate/BIOL218_2023Spring/Flower/Bud/Flower_Bud_1.fastq.gz -2 /project/ct-frstate/BIOL218_2023Spring/Flower/Bud/Flower_Bud_2.fastq.gz -od /projectnb/ct-frstate/professor/Flower_Bud_rcorrector_job1

# Deactivate environment
conda deactivate
