#CHI SQUARE
#3650393
#8TH NOVEMBER 2019

#libraries
library(tidyverse)

chi <- read.csv("Datasets/Animals/ChiSquare.csv")
chi <- chi %>% remove_rownames %>% column_to_rownames(var="Month")                        
chinpr1 <- chi %>% select("NPR1")
chinpr2 <- chi %>% select("NPR2")
chinpr3 <- chi %>% select("NPR3")
chi_table <- as.table(as.matrix(chi)) 

chisq_npr1 <- chisq.test(chinpr1) #significant 
chisq_npr1

chisq_npr2 <- chisq.test(chinpr2) #not significant
chisq_npr2

chisq_npr3 <- chisq.test(chinpr3) #significant 
chisq_npr3

chisq_overall <- chisq.test(chi) #significant
chisq_overall

chisq_overall$estimate

chi_all <- read.csv("Datasets/Animals/Chi_All_Detections.csv")
chi_all <- chi_all %>% remove_rownames %>% column_to_rownames(var="Month")
chi_all_npr1 <- chi_all %>% select("NPR1")
chi_all_npr2 <- chi_all %>% select("NPR2")
chi_all_npr3 <- chi_all %>% select("NPR3")

chisq_all_npr1 <- chisq.test(chi_all_npr1) #significant
chisq_all_npr1

chisq_all_npr2 <- chisq.test(chi_all_npr2) #not significant 
chisq_all_npr2

chisq_all_npr3 <- chisq.test(chi_all_npr3) #signifcant
chisq_all_npr3

chisq_all <- chisq.test(chi_all) #signifcant
chisq_all

