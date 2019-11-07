#library
library(tidyverse)

detection <- read_csv("Datasets/Animals/Anova_Detection_Rates.csv")
detection <- gather(detection, "Camera", "Detections", 2:4) #combine columns

detection_anova <- aov(Detections ~ Month, data = detection) #has all 4 diets
summary(detection_anova)

tukey <- TukeyHSD(detection_anova)
summary(tukey)
plot(tukey)

SigOnly <- tukey 
SigOnly$Month <- SigOnly$Month[SigOnly$Month[,'p adj'] < .05, ]
plot(SigOnly)
