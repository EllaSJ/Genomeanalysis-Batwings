directory <- "~/Documents/Civilingenjör_molekylär_bioteknik/Ar_4/Genome_Analysis/DESeq2_R/htseq_files/"

sampleFiles <- list.files(directory)
sampleCondition <- c("Forelimb", "Forelimb", "Hindlimb", "Hindlimb")
sampleTable <- data.frame(sampleName=sampleFiles, 
                          fileName=sampleFiles, 
                          condition=sampleCondition)

library(DESeq2)
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, 
                                       directory = directory, 
                                       design = ~ condition)
ddsHTSeq

dds <- DESeq(ddsHTSeq)
res <- results(dds)
res
