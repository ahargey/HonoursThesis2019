#AYESHA HARGEY
#3650393
#4TH NOVEMBER 2019
#CAMTRAPR

#LIBRARIES
library(tidyverse)
library(camtrapR)
setwd('C:/Users/PC/Documents/HonoursThesis2019')

#LOAD IN ACCUMULATED DATASETS
npr1records <- read.csv("Datasets/CamtrapR/NPR1 - Aggregation.csv",
                    stringsAsFactors = FALSE)
npr2records <- read.csv("Datasets/CamtrapR/NPR2 - Aggregation.csv",
                    stringsAsFactors = FALSE)
npr3records <- read.csv("Datasets/CamtrapR/NPR3 - Aggregation.csv",
                    stringsAsFactors = FALSE)
total       <- read.csv("Datasets/CamtrapR/Total_Overall_Record.csv",
                 stringsAsFactors = FALSE)
unidentified       <- read.csv("Datasets/CamtrapR/Unidentified.csv",
                        stringsAsFactors = FALSE)

#create DateTimeOrginal column in proper format for camtrapR
npr1records$DateTimeOriginal <- strptime(paste(npr1records$Date, npr1records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")
npr2records$DateTimeOriginal <- strptime(paste(npr2records$Date, npr2records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")
npr3records$DateTimeOriginal <- strptime(paste(npr3records$Date, npr3records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")
total$DateTimeOriginal       <- strptime(paste(total$Date, total$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")
unidentified$DateTimeOriginal       <- strptime(paste(unidentified$Date, unidentified$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")

#assigning species names
species1activity <- "African Wild Cat"
species2activity <- "Baboon"	
species3activity <- "Caracal"	
species4activity <- "Cattle"
species5activity <- "Dog"	
species6activity <- "Eland"	
species7activity <- "Jackal"	
species8activity <- "Klipspringer"	
species9activity <- "Kudu"	
species10activity <- "Mongoose"	
species11activity <- "Oryx"	
species12activity <- "Porcupine"	
species13activity <- "Scrub Hare"	
species14activity <- "Steenbok"
species15activity <- "Unidentified"

activityHistogram (recordTable = total,
                   species     = species13activity)


activityDensity(recordTable = records,
                species     = species3activity)


activityOverlap (recordTable = total,
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
                 add.rug     = FALSE,
                 extend      = "lightgrey",
                 ylim        = c(0, 0.25),
                 main        = paste("Activity overlap"))

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
                                                                        #"NPR2", "NPR3"))))
as.data.frame(cameratable)

Mapstest1 <- detectionMaps(CTtable     = CameraStationTable,
                           recordTable  = total,
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
                           
                           
reportTest <- surveyReport (recordTable          = total,
                            CTtable              = CameraStationTable,
                            speciesCol           = "Species",
                            stationCol           = "Station",
                            setupCol             = "Setup_date",
                            retrievalCol         = "Retrieval_date",
                            CTDateFormat         = "%d/%m/%Y", 
                            recordDateTimeCol    = "DateTimeOriginal",
                            recordDateTimeFormat = "%Y-%m-%d %H:%M:%S",
                            CTHasProblems        = FALSE)

total_baboons <- total[total$Species == "Baboon",]

Mapstest2 <- detectionMaps(CTtable      = ,
                           recordTable   = ,
                           Xcol          = "utm_x",
                           Ycol          = "utm_y",
                           stationCol    = "Station",
                           speciesCol    = "Species",
                           speciesToShow = "Baboon",     # added
                           printLabels   = TRUE,
                           richnessPlot  = FALSE,     # changed
                           speciesPlots  = TRUE,      # changed
                           addLegend     = TRUE)

Mapstest1 <- detectionMaps(CTtable      = CameraStationTable,
                           recordTable   = total_baboons,
                           Xcol          = "utm_x",
                           Ycol          = "utm_y",
                           stationCol    = "Station",
                           speciesCol    = "Species",
                           speciesToShow = "Baboon",     # added
                           printLabels   = TRUE,
                           richnessPlot  = FALSE,     # changed
                           speciesPlots  = TRUE,      # changed
                           addLegend     = TRUE)
Mapstest1
