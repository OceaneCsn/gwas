load("rdata/phenotypes_regmap_unfiltered.RData")
source("https://gist.githubusercontent.com/benmarwick/2a1bb0133ff568cbe28d/raw/fb53bd97121f7f9ce947837ef1a4c65a73bffb3f/geom_flat_violin.R") 

library(ggplot2)

d <- reshape2::melt(regmap[,stringr::str_detect(colnames(regmap), "change")])


ggplot(d, aes(x = variable, y = value, fill = variable)) + 
  geom_hline(yintercept = 0, size = 2, col = "darkred") +
  geom_flat_violin(position = position_nudge(x = 0.2, y = 0), alpha = 0.8) + 
  geom_point(aes(y = value, color = variable), position = position_jitter(width = 0.15), size = 1, alpha = 0.7) + 
  geom_boxplot(width = 0.2, outlier.shape = NA, alpha = 0.8, fill = "white") + 
  labs(y = "Relative change due to eCO2", x = NULL) + ggtitle("Relative change due to eCO2")


load("rdata/phenotypes_regmap.RData")
d <- reshape2::melt(regmap[,stringr::str_detect(colnames(regmap), "change")])


ggplot(d, aes(x = variable, y = value, fill = variable)) + 
  geom_hline(yintercept = 0, size = 2, col = "darkred") +
  geom_flat_violin(position = position_nudge(x = 0.2, y = 0), alpha = 0.8) + 
  geom_point(aes(y = value, color = variable), position = position_jitter(width = 0.15), size = 1.25, alpha = 0.7) + 
  geom_boxplot(width = 0.2, outlier.shape = NA, alpha = 0.8, fill = "white") + 
  labs(y = "Relative change due to eCO2 (%)", x = NULL) + ggtitle("Relative change due to eCO2")
