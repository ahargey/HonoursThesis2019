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

recordTable(inDir  = records)
