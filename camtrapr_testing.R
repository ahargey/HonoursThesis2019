#AYESHA HARGEY
#3650393
#8TH OCTOBER 2019
#CAMTRAPR TESTING

#LIBRARIES
library(tidyverse)
library(camtrapR)

wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")
data(recordTableSample)

# load record table
data(recordTableSample)
view(recordTableSample)
# generate activity histogram
species4activity <- "VTA"    # = Viverra tangalunga, Malay Civet

activityHistogram (recordTable = recordTableSample,
                   species     = species4activity,
                   allSpecies = FALSE)

species1activity <- "PBE"    # = Viverra tangalunga, Malay Civet

activityHistogram (recordTable = recordTableSample,
                   species     = species1activity,
                   allSpecies = FALSE)

# load record table
data(recordTableSample)
# define species of interest
speciesA_for_activity <- "VTA" # = Viverra tangalunga, Malay Civet
speciesB_for_activity <- "PBE" # = Prionailurus bengalensis, Leopard Cat
# create activity overlap plot (basic)
activityOverlap (recordTable = recordTableSample,
                 speciesA = speciesA_for_activity,
                 speciesB = speciesB_for_activity,
                 writePNG = FALSE,
                 plotR = TRUE
)
# create activity overlap plot (prettier and with some overlapPlot arguments set)
activityOverlap (recordTable = recordTableSample,
                 speciesA = speciesA_for_activity,
                 speciesB = speciesB_for_activity,
                 writePNG = FALSE,
                 plotR = TRUE,
                 createDir = FALSE,
                 pngMaxPix = 1000,
                 linecol = c("black", "blue"),
                 linewidth = c(5,3),
                 linetype = c(1, 2),
                 olapcol = "darkgrey",
                 add.rug = TRUE,
                 extend = "lightgrey",
                 ylim = c(0, 0.25),
                 main = paste("Activity overlap: ",
                              speciesA_for_activity, "-",
                              speciesB_for_activity)
)

# load record table
data(recordTableSample)
species4activity <- "PBE" # = Prionailurus bengalensis, Leopard Cat
activityRadial(recordTable = recordTableSample,
               species = species4activity,
               allSpecies = FALSE,
               speciesCol = "Species",
               recordDateTimeCol = "DateTimeOriginal",
               plotR = TRUE,
               writePNG = FALSE,
               lwd = 5
)
# plot type = polygon
activityRadial(recordTable = recordTableSample,
               species = species4activity,
               allSpecies = FALSE,
               speciesCol = "Species",
               recordDateTimeCol = "DateTimeOriginal",
               plotR = TRUE,
               writePNG = FALSE,lwd = 5,
               rp.type = "p"
)

#making data
wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR", lib.loc = .libPaths())
length(list.files(wd_images_ID, pattern = "JPG", recursive = TRUE))
rec.db.species0 <- recordTable(inDir  = wd_images_ID,
                               IDfrom = "directory")

write.csv(rec.db.species0, "camtrapr.csv")

records <- read_csv("NPR2-2_Test.csv")

#2. make a date/time column. Assuming you load this table as a data.frame called records, you can create that column with something like:
records$DateTimeOriginal <- strptime(paste(records$Date, records$Time, sep = " "), format = "%d-%b-%y %H:%M")     # i didn't test this. If it doesn't work check ?strptime

records$DateTimeOriginal <- strptime(paste(records$Date, records$Time, sep = " "), format = "%d-%b-%y %H:%M")
data(camtraps)

test <- recordTable(inDir  = records,
                   IDfrom = "directory")

library(readr)
NPR2_2_Test <- read_csv("NPR2-2_Test.csv", 
                          +     col_types = cols(Animal = col_skip(), 
                                                 +         DeleteFlag = col_skip(), FalseTrigger = col_skip(), 
                                                 +         ImageQuality = col_skip(), Temperature = col_skip(), 
                                                 +         Water = col_skip(), Weather = col_skip()))
View(NPR2_2_Test)

NPR2_2_Test$DateTimeOriginal <- strptime(paste(NPR2_2_Test$Date, NPR2_2_Test$Time, sep = " "), format = "%d-%b-%y %H:%M")

test <- recordTable(inDir  = NPR2_2_Test,
                    IDfrom = "directory")

data(camtraps)
species1activity <- "Porcupine"

activityDensity(recordTable = NPR2_2_Test,
                species     = species1activity)

activityHistogram (recordTable = NPR2_2_Test,
                   species     = species1activity)

records <- read.csv("C:/Users/PC/Documents/HonoursThesis2019/NPR2-2_Test.csv",
                    stringsAsFactors = FALSE)

# create DateTimeOrginal column in proper format
records$DateTimeOriginal <- strptime(paste(records$Date, records$Time, sep = " "), format = "%d-%b-%y %H:%M", tz = "UTC")

strptime(paste(as.Date(records$Date, format = "%m/%d/%y"), 
                                           records$Time), format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

species1activity <- "Jackal"
species2activity <- "Eland"
species3activity <- "Baboon"
activityHistogram (recordTable = records,
                   species     = species1activity)

activityDensity(recordTable = records,
                species     = species1activity)

activityHistogram (recordTable = records,
                   species     = species3activity)

activityDensity(recordTable = records,
                species     = species3activity)

activityRadial(recordTable  = records,
               species      = species1activity,
               lwd          = 3       # adjust line with of the plot
)

activityOverlap (recordTable = records,
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

data(camtraps)
write.csv(camtraps,"stationtable.csv")                 

records <- read.csv("C:/.../camtrapR_example.csv",
                    stringsAsFactors = FALSE)

records_temporal_test <- records

# create DateTimeOrginal column in proper format
records$DateTimeOriginal <- strptime(paste(as.Date(records$Date, format = "%m/%d/%y"), 
                                           records$Time), format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

# assign a species 
records_temporal_test$Species <- "jackal"

# 
records_filter1_min <- assessTemporalIndependence(intable = records_temporal_test,
                                                  deltaTimeComparedTo = "lastIndependentRecord",
                                                  columnOfInterest = "Species",
                                                  stationCol = "Camera.Trap.name",
                                                  cameraCol = "Camera.Serial.Number",
                                                  camerasIndependent = FALSE,
                                                  minDeltaTime = 1
)

records_filter30_min <- assessTemporalIndependence(intable = records,
                                                   deltaTimeComparedTo = "lastIndependentRecord",
                                                   columnOfInterest = "Species",
                                                   stationCol = "Camera.Trap.name",
                                                   cameraCol = "Camera.Serial.Number",
                                                   camerasIndependent = FALSE,
                                                   minDeltaTime = 30
)

View(records)
View(records_filter1_min)
View(records_filter30_min)


# assign 2 different species
records$Species <- c(rep("lion", times = 3),
                     rep("giraffe", times = nrow(records) - 3))

records_filter30_min_2_spec <- assessTemporalIndependence(intable = records,
                                                          deltaTimeComparedTo = "lastIndependentRecord",
                                                          columnOfInterest = "Species",
                                                          stationCol = "Camera.Trap.name",
                                                          cameraCol = "Camera.Serial.Number",
                                                          camerasIndependent = FALSE,
                                                          minDeltaTime = 30
)

View(records_filter30_min_2_spec)


# remove argument cameraCol, and set removeNonIndependentRecords = FALSE
records_filter30_min_2_spec_return_all <- assessTemporalIndependence(intable = records,
                                                                     deltaTimeComparedTo = "lastIndependentRecord",
                                                                     columnOfInterest = "Species",
                                                                     stationCol = "Camera.Trap.name",
                                                                     #  cameraCol = "Camera.Serial.Number",
                                                                     camerasIndependent = FALSE,
                                                                     minDeltaTime = 30,
                                                                     removeNonIndependentRecords = FALSE
)

View(records_filter30_min_2_spec_return_all)