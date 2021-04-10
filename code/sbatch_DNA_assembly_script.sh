#!/bin/bash -l
#SBATCH	-A g2021012
#SBATCH	-M snowy
#SBATCH	-p core
#SBATCH	-n 2
#SBATCH	-t 03:00:00
#SBATCH	-J DNA_assembly_ellasj
#SBATCH	--mail-type=ALL
#SBATCH --mail-user ellasj@hotmail.com

# Load modules
module load bioinfo-tools
module load soapdenovo

# Commands
SOAPdenovo-63mer all -s soap.config -o asm -F -R -E -w -u -K 55 -p 8 >> SOAPdenovo.log
GapCloser -b soap.config -a asm.scafSeq -o asm.new.scafSeq -t 8 >> SOAPdenovo.log
