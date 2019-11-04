# first load the camera trap station table
data(camtraps)


camop_problem <- cameraOperation(CTtable      = CameraStationTable,
                                 stationCol   = "Station",
                                 setupCol     = "Setup_date",
                                 retrievalCol = "Retrieval_date",
                                 writecsv     = FALSE,
                                 hasProblems  = FALSE,
                                 dateFormat   = "%d/%m/%Y")

CameraStationTable <- read_csv("Datasets/CamtrapR/CameraStationTable.csv", 
                               col_types = cols(Retrieval_date = col_factor(levels = c("20/06/2018")), 
                                                Setup_date = col_factor(levels = c("21/04/2017", 
as.data.frame()                                                                                   "20/04/2017")), Station = col_factor(levels = c("NPR1", 
                                                                                                                                   "NPR2", "NPR3")), X1 = col_skip(), 
                                                utm_x = col_integer(), utm_y = col_integer()))
View(CameraStationTable)
class(CameraStationTable)
as.data.frame(CameraStationTable)
