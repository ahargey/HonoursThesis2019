#SPECIES RICHNESS
#AYESHA HARGEY
#3650393

#LIBRARIES
library(tidyverse)
library(camtrapR)

richness <- read_csv("Datasets/Animals/Species_Richness_CSV_2.csv")

richness$Month <- factor(richness$Month, levels = richness$Month)

ggplot(richness, aes(x = Month, y = SR, fill = Site)) +
  geom_bar(stat = "identity", position=position_dodge())
