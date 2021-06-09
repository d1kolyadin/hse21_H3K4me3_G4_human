setwd("C:\\local files\\bi\\project\\src")
source('lib.R')

#NAME <- 'H3K4me3_A549.ENCFF046DTX.hg38'
#NAME <- 'H3K4me3_A549.ENCFF046DTX.hg19'
#NAME <- 'H3K4me3_A549.ENCFF922TPS.hg38'
NAME <- 'H3K4me3_A549.ENCFF922TPS.hg19'

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)

bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 5000)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(paste0(NAME, '.filtered'), subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.filtered.pdf'), path = OUT_DIR)

bed_df %>%
  select(-len) %>%
  write.table(file=paste0(DATA_DIR, NAME, '.filtered.bed'),
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)