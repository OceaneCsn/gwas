load("rdata/phenotypes_regmap.RData")


SNPmatrix <- fst::fst("data/SNPmatrix_full.fst")
dim(SNPmatrix)
SNPmatrix[1:10,1:10]

common_acc <- intersect(regmap$ecotype, colnames(SNPmatrix))

map <- SNPmatrix[,c("chrom", "pos")]

snp <- SNPmatrix[,as.character(common_acc)]

snp <- snp[rowSums(snp[,as.character(common_acc)]) > 0,]

map <- map[rownames(snp),]

save(map, file = "rdata/snp_chromosomic_map.RData")

rownames(SNPmatrix)



megmap_acc <- length(annot$Ecotype_ID)
g1001_acc <- length(colnames(SNPmatrix))
length(intersect(annot$Ecotype_ID, colnames(SNPmatrix)))

save(snp, file = "rdata/SNP_matrix_62_accessions_regmap_1001genomes_snp_only.RData")

load("rdata/SNP_matrix_62_accessions_regmap_1001genomes.RData")


common_acc <- intersect(regmap$ecotype, colnames(snp))


library(mlmm)
data(example_data, package="mlmm")
str(example_data)


mygwas <- mlmm(Y=example_data$Y, X=example_data$X, K=example_data$K, nbchunks=2, maxsteps=10)