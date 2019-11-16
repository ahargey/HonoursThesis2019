#AYESHA HARGEY
#3650393
#4TH NOVEMBER 2019
#CAMTRAPR

#LIBRARIES
library(tidyverse)
library(camtrapR)
library(ggpubr)
library(ggplot2)

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
species1activity <- "African Wild Cat" #2
species2activity <- "Baboon" #30	
species3activity <- "Caracal"	#1
species4activity <- "Cattle" #15
species5activity <- "Dog"	#1
species6activity <- "Eland"	#3
species7activity <- "Jackal" #10	
species8activity <- "Klipspringer" #1	
species9activity <- "Kudu"	#5
species10activity <- "Mongoose"	#1
species11activity <- "Oryx"	#4
species12activity <- "Porcupine" #3	
species13activity <- "Scrub Hare"	 #1
species14activity <- "Steenbok" #12
species15activity <- "Unidentified" #10

activityHistogram (recordTable = total,
                   species     = species1activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species2activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species3activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species4activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species5activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species6activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species7activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species8activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species9activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species10activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species11activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species12activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species13activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = total,
                   species     = species14activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

activityHistogram (recordTable = unidentified,
                   species     = species15activity,
                   writePNG    = FALSE,
                   createDir   = FALSE,
                   plotDirectory = "Histograms")

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
