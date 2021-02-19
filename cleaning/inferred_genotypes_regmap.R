library("genio")

file_plink <- 'data/arabidopsis_2029_Maf001_filter95/arabidopsis_2029_Maf001_filter95'


time_read_genio <- system.time(
  data_genio <- read_plink(file_plink)
)
