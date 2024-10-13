#!/bin/bash -l

#Request 16 cores on a single node
#$ -pe omp 16
#$ -l h_rt=00:30:00
#$ -P ct-frstate
#$ -m e
#$ -N fastqc_flower_postTrinity

# Load modules
module load openmpi/3.1.4

# Activate FastQC environment
conda activate fastqc_0_12_1

# Run FastQC on raw reads
fastqc Flower_Bud_1.fastq.gz Flower_Bud_2.fastq.gz

# Deactivate environment
conda deactivate
