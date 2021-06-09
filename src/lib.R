.libPaths("C:\\Program Files\\R\\R_libs")

library(ggplot2)
library(dplyr)
library(tidyr)
library(tibble)

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

library(ChIPpeakAnno)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)

DATA_DIR <- '../data/'
OUT_DIR <- '../images/'