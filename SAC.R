#AYESHA HARGEY
#3650393
#17TH OCTOBER 2019
#SAC TESTING

#LIBRARIES
library(tidyverse)
library(camtrapR)
library(iNEXT)
library(vegan)

#DATA LOADED
sac <- read.csv("Datasets/Animals/SAC/SAC_Aggregation_CSV.csv")
all_sites_sac <- read.csv("Datasets/Animals/SAC/SAC_All_Species_CSV.csv")

all_sites_sac <- select(all_sites_sac, -Date)

curve <- read_delim("CURVES ONLY.csv",
                    ";", escape_double = FALSE,
                    trim_ws = TRUE) #bryan's code

curve.main = curve[1:38,15:24] #bryan's code
curve.data = curve[3:12] #bryan's code

sac_main = sac[,3:16] #removing date columns #bryan's code
sac_site = sac[,3:16] #bryan's code

curve_all_sites = specaccum(all_sites_sac, method = "exact")

curve_all = specaccum(sac_main, method = "exact") #full graph

#subset each habitat into its own df
NPR1 <- sac %>% filter(Site == "NPR1")
NPR2 <- sac %>% filter(Site == "NPR2")
NPR3 <- sac %>% filter(Site == "NPR3")

NPR1 <- select(NPR1, -Date, -Site)
NPR2 <- select(NPR2, -Date, -Site)
NPR3 <- select(NPR3, -Date, -Site)

#calc species accumulation curve for each habitat
curve_NPR1 = specaccum(NPR1, method = "exact")
curve_NPR2 = specaccum(NPR2, method = "exact")
curve_NPR3 = specaccum(NPR3, method = "exact")

#plot curve_all first
plot(curve_all_sites,
     xlab = "Months",
     ylab = "Species (N)")
#then plot the rest
plot(curve_NPR1, add = TRUE, ci = 0, col="hotpink", lwd=2) #col is COLOUR setting, so change it to something else if you want
plot(curve_NPR2, add = TRUE, ci = 0, col = "orchid4", lwd = 2)
plot(curve_NPR3, add = TRUE,ci = 0, col = "lightblue", lwd = 2)

legend(8, 6, legend=c("NPR1", "NPR2", "NPR3"),
       col=c("hotpink", "orchid4", "lightblue"), lty=1)

