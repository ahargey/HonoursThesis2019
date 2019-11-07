#CAMTRAPR STATION TABLE PROBLEM 
#library
library(tidyverse)
library(camtrapR)

# CameraStationTable <- read_csv("Datasets/CamtrapR/CameraStationTable.csv", 
#                                col_types = cols(Retrieval_date = col_factor(levels = c("20/06/2018")), 
#                                                 Setup_date = col_factor(levels = c("21/04/2017", 
#                                                                                     "20/04/2017")), Station = col_factor(levels = c("NPR1", 
#                                                                                                                                    "NPR2", "NPR3")), X1 = col_skip(), 
#                                                 utm_x = col_integer(), utm_y = col_integer()))

#. I have put your data in the local directory
dir()

# change the complex data structure to just an R data frame.  You must assign the new object.
CameraStationTable <- read_csv("Datasets/CamtrapR/CameraStationTable.csv")
dim(CameraStationTable)
str(CameraStationTable)
class(CameraStationTable)

CameraStationTable <- as.data.frame(CameraStationTable)

camop_problem <- cameraOperation(CTtable      = CameraStationTable,
                                 stationCol   = "Station",
                                 setupCol     = "Setup_date",
                                 retrievalCol = "Retrieval_date",
                                 writecsv     = FALSE,
                                 hasProblems  = FALSE,
                                 dateFormat   = "%d/%m/%Y")

camop_problem 
