library(tidyverse)

raw <- read_csv("code/data/tempLawIndex.csv")

library(factoextra) # principle component analysis
library(ggbiplot)

data(raw)
indexActive <- raw[-c(1:9)] # select only indexed variables, take out states b/c character 
row.names(indexActive) <- raw %>% pull(state)
prcomp(indexActive, scale = TRUE)  %>% # pca, scale = T, standardizes ranges 
summary()

ggbiplot(prcomp(indexActive, scale = TRUE), labels = rownames(indexActive))

