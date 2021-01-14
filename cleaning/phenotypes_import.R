
#################################### REGMAP ######################################

# data import and saving to rdata

regmap <- read.csv("data/phenotypes_regmap.csv", na.strings = ".")
rownames(regmap) <- regmap$genotype


# Hov 4 est dupliqué, un des seuls réplicats peut être. J'en fais une moyenne
hov4.1 <- colMeans(regmap[regmap$genotype == "Hov4-1", colnames(regmap) != "genotype"])

regmap <- regmap[regmap$genotype != "Hov4-1",]
rownames(regmap) <- regmap$genotype
regmap <- regmap[,colnames(regmap) != "genotype"]


regmap["Hov4-1",] <- hov4.1
colnames(regmap)


annot <- read.csv("data/accessions_1307_regMap.csv")
save(annot, file = "rdata/accessions_regmap_annotation.RData")

length(intersect(annot$original_n.., rownames(regmap)))

rownames(regmap)[!rownames(regmap) %in% annot$original_n..]

# ids from 1001 genome project
regmap$ecotype <- annot[match(rownames(regmap), annot$original_n..), "Ecotype_ID"]

elements <- unique(stringr::str_split_fixed(colnames(regmap), '_', 2)[,1])
elements <- elements[elements != "ecotype"]

for(el in elements){
  regmap[,paste0(el, '_change')] <- (regmap[,paste0(el,"_eCo2")] - regmap[,paste0(el,"_aCo2")])/
    regmap[,paste0(el,"_aCo2")] * 100
}


save(regmap, file = "rdata/phenotypes_regmap_unfiltered.RData")
