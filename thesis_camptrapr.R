#AYESHA HARGEY
#3650393
#4TH NOVEMBER 2019
#CAMTRAPR

#LIBRARIES
library(tidyverse)
library(camtrapR)

#LOAD IN ACCUMULATED DATASETS
npr1records <- read.csv("Datasets/CamtrapR/NPR1 - Aggregation.csv",
                    stringsAsFactors = FALSE)
npr2records <- read.csv("Datasets/CamtrapR/NPR2 - Aggregation.csv",
                    stringsAsFactors = FALSE)
npr3records <- read.csv("Datasets/CamtrapR/NPR3 - Aggregation.csv",
                    stringsAsFactors = FALSE)

#create DateTimeOrginal column in proper format for camtrapR
npr1records$DateTimeOriginal <- strptime(paste(npr1records$Date, npr1records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")
npr2records$DateTimeOriginal <- strptime(paste(npr2records$Date, npr2records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")
npr3records$DateTimeOriginal <- strptime(paste(npr3records$Date, npr3records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")


species1activity <- "Baboon"
species2activity <- "Cattle"
species3activity <- "Steenbok"
species4activity <- "Jackal"

activityHistogram (recordTable = npr1records,
                   species     = species1activity)

activityDensity(recordTable = npr1records,
                species     = species1activity)

activityHistogram (recordTable = records,
                   species     = species3activity)

activityDensity(recordTable = records,
                species     = species3activity)


activityOverlap (recordTable = npr1records,
                 speciesA    = species1activity,
                 speciesB    = species3activity,
                 writePNG    = FALSE,
                 plotR       = TRUE,
                 createDir   = FALSE,
                 pngMaxPix   = 1000,
                 linecol     = c("black", "blue"),
                 linewidth   = c(5,3),
                 linetype    = c(1, 2),
                 olapcol     = "darkgrey",
                 add.rug     = TRUE,
                 extend      = "lightgrey",
                 ylim        = c(0, 0.25),
                 main        = paste("Activity overlap of jackals ad"))

#camera table
cameratable <- read_csv("Datasets/CamtrapR/CameraStationTable.csv")
as.data.frame(test)

cameratable <- cameratable %>% select(-X1)

library(readr)
cameratable <- read_csv("Datasets/CamtrapR/CameraStationTable.csv", 
                 col_types = cols(Station = col_factor(levels = c("NPR1", 
                                                                  "NPR2", "NPR3")), X1 = col_skip()))
as.data.frame(cameratable)
#View(test)
#testing with species <- read_csv("Datasets/CamtrapR/TEST_NPR1 - Aggregation.csv", 
                       #col_types = cols(Station = col_factor(levels = c("NPR1", 
                                                                        "NPR2", "NPR3"))))
as.data.frame(cameratable)

Mapstest1 <- detectionMaps(CTtable     = cameratable,
                           recordTable  = test_table,
                           Xcol         = "utm_x",
                           Ycol         = "utm_y",
                           stationCol   = "Station",
                           speciesCol   = "Species",
                           printLabels  = TRUE,
                           richnessPlot = TRUE,    # by setting this argument TRUE
                           speciesPlots = FALSE,
                           addLegend    = TRUE)

camop_problem <- cameraOperation(CTtable      = camtraps,
                                 stationCol   = "Station",
                                 setupCol     = "Setup_date",
                                 retrievalCol = "Retrieval_date",
                                 writecsv     = FALSE,
                                 hasProblems  = TRUE,
                                 dateFormat   = "%d/%m/%Y")

Mapstest1 <- detectionMaps(CTtable     = camtraps,
                           recordTable  = recordTableSample,
                           Xcol         = "utm_x",
                           Ycol         = "utm_y",
                           stationCol   = "Station",
                           speciesCol   = "Species",
                           printLabels  = TRUE,
                           richnessPlot = TRUE,    # by setting this argument TRUE
                           speciesPlots = FALSE,
                           addLegend    = TRUE)
                           
                           
                           # load sample camera trap station table
                           data(camtraps)
                           
                           # load sample record table
                           data(recordTableSample)
