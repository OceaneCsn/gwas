load("rdata/phenotypes_regmap.RData")
load("rdata/SNP_matrix_62_accessions_regmap_1001genomes_snp_only.RData")
load("rdata/accessions_regmap_annotation.RData")


library(ade4)
x <- t(snp)

pca <- dudi.pca(x)