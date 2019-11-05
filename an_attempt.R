#library
library(tidyverse)

chicks <- datasets::ChickWeight

cheeky <- read_csv("Datasets/Animals/a cheeky test.csv")
View(cheeky)

long <- read_csv("Datasets/Animals/long.csv")
long <- read_csv("Datasets/Animals/long.csv", 
                 col_types = cols(Month = col_factor(levels = c("April", 
                                                                "May", "June", "July", "August", 
                                                                "September", "October", "November", 
                                                                "December", "January", "February", 
                                                                "March", "April_1", "May_1", "June_1"))))
View(long)
View(long)

cheeky.aov1 <- aov(X1 ~ May + June + July + August, data = cheeky) #has all 4 diets
summary(cheeky.aov1)

long.aov1 <- aov(Month ~ ., data = long) #has all 4 diets
summary(long.aov1)

cheeky.anova <- aov(X1 ~ April + May + June, data = cheeky, na.action=na.exclude) #has all 4 diets
summary(chicks.aov1) #output of anova 


library(dplyr)
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv"
df <- read.csv(PATH) %>%
  select(-X) %>% 
  mutate(poison = factor(poison, ordered = TRUE))
glimpse(df)