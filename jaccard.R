#AYESHA HARGEY
#3650393
#JACCARD INDEX

#load libraries
library(tidyverse)
library(vegan)

jac <- read_csv("Datasets/Animals/Jaccard.csv")
jac_t <- t(jac)
jac_result <- vegdist(jac_t, "jaccard", binary = TRUE)
round(as.matrix(jac_result))
head(jac_result)
head(sqrt(jac_result))

coldiss(jac_result, byrank = FALSE, diag = TRUE)

summary(jac_result)
jacccc <- as.table(jac_result)

library(ade4)
m <- read.table("Datasets/Animals/Jaccard.csv", header=TRUE)
m1 <- read.table(jac_t, header=F)
d <- dist.binary(jac_t, method = 1, diag = FALSE, upper = FALSE) #method 1 is Jaccard index (1901) S3 coefficient of Gower & Legendre
hc <- hclust(d)               # apply hierarchical clustering 
plot(hc, labels=m$ID)    # plot the dendrogram
