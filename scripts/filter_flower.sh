#!/bin/bash -l

#Request 28 cores
#$ -pe omp 28
#$ -l h_rt=03:00:00
#$ -P ct-frstate
#$ -N Flower_Bud_rcorrector_filter_job1
#$ -m ae
#$ -o Flower_Bud_rcorrector_filter_job1_output
#$ -e Flower_Bud_rcorrector_filter_job1_error

# Load modules
module load openmpi/3.1.4
module load python2/2.7.16

# Run FilterUncorrectabledPEfastq.py to remove unfixable reads
mpirun -np 28 python /usr2/collab/studentuser/Flower_Bud/rcorrector_job1/TranscriptomeAssembly/TranscriptomeAssemblyTools/FilterUncorrectabledPEfastq.py -1 /usr2/collab/studentuser/Flower_Bud/rcorrector_job1/Flower_Bud_1.cor.fq.gz -2 /usr2/collab/studentuser/Flower_Bud/rcorrector_job1/Flower_Bud_2.cor.fq.gz -s Flower_Bud_rcorrector_sum
