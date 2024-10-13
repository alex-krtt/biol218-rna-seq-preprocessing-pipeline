# De Novo Transcriptome Assembly of a Flowering Plant

## Overview
Final project for BIOL218 at FSU: A pipeline for improving genome quality and transcriptome assembly by pre-processing RNA-Seq data using tools like FastQC, Rcorrector, TranscriptomeAssemblyTools, TrimGalore!, and Trinity.


## Abstract
A flowering plant species was used to generate a de novo transcriptome assembly of the mature flower bud stage. This study aims to better understand the genetic composition and regulation during flower development. The bioinformatics pipeline utilized in this study includes tools like FastQC, RCorrector, Trim Galore, and Trinity. The results offer valuable insights into gene regulation, flower development, and potential targets for breeding efforts.

## Running the Scripts

The following steps will guide you through running the provided `.sh` scripts to preprocess the genomic data for **Flower** bud tissue. The scripts have been set up to work efficiently on a **CentOS 7** cluster environment. The jobs are intended to be queued using the **SGE scheduler** for high-performance computing (HPC).

### Prerequisites
- Ensure you have a **CentOS 7** environment with access to an **SGE** cluster.
- All necessary software modules and Conda environments should be installed as per each script's requirements.

### General Steps to Run the Scripts

1. **Clone the Repository**
   
   First, clone the repository to your local environment or cluster workspace:
   ```sh
   git clone https://github.com/yourusername/Flower_Bud_Transcriptome_Pipeline.git
   cd Flower_Bud_Transcriptome_Pipeline
   ```

2. **Submit Jobs Using SGE Scheduler**

   The scripts are intended to be submitted as **SGE** jobs for parallel execution on the cluster. Use the `qsub` command to submit each script in the correct order:

   ```sh
   # Submit FastQC analysis
   qsub fastqc_flower.sh

   # Submit rCorrector for error correction
   qsub rcorrector_flower.sh

   # Submit the script for filtering unfixable reads
   qsub filter_flower.sh

   # Submit TrimGalore for quality and adapter trimming
   qsub trimgalore_flower.sh

   # Submit Trinity for transcriptome assembly
   qsub trinity_flower.sh

   # Submit BUSCO analysis of transcriptome assembly
   qsub busco_flower.sh
   ```

### Notes
- Ensure all paths in the scripts are correct for your specific environment.
- You may need to modify the resource allocation parameters (e.g., number of cores, memory) based on the resources available on your cluster.
- The scripts assume the environment modules are available for use with `module load`. If your system does not use `module`, adjust accordingly.

## Acknowledgments

This project was made possible through the contributions and support of several individuals and organizations. I want to thank the Chun-Neng Wang Lab for providing the unpublished raw RNA reads of Flower bud tissue, which were crucial for my analysis. I also acknowledge the Massachusetts Green High Performance Computing Center for access to their computing resources, allowing me to process and analyze substantial data efficiently. The support from the Boston University Shared Computing Cluster was also instrumental in completing this project. Lastly, I extend my gratitude to my professor Dr. Cheng-Chiang Wu for his tools and guidance, which significantly advanced my research efforts.