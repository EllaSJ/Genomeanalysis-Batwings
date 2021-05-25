# Specify directory
directory <- "~/Documents/Civilingenjör_molekylär_bioteknik/Ar_4/Genome_Analysis/DESeq2_R/htseq_files/"

# Make a list of the files in the directory and specify conditions
sampleFiles <- list.files(directory)
sampleCondition <- c("Forelimb", "Forelimb", "Hindlimb", "Hindlimb")

# Make a table out of the files and conditions
sampleTable <- data.frame(sampleName=sampleFiles, 
                          fileName=sampleFiles, 
                          condition=sampleCondition)

# Load DESeq2 library and create a DESeq2 dataset from htseq count
library(DESeq2)
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, 
                                       directory = directory, 
                                       design = ~ condition)
ddsHTSeq

# Write out results
dds <- DESeq(ddsHTSeq)
res <- results(dds)
res
