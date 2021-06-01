library(dplyr)
library(data.table)
#Extract the Data

pathFile <- "../exdata_data_household_power_consumption/household_power_consumption.txt"
DT <-read.table(pathFile,
                sep = ";", header = TRUE, na.strings = "?",
                colClasses = c(rep("character", 2), rep("numeric", 7)))         ## load Data, remove Convert "?" into NA
                                                                                ## Coerce first 2 cols to char and others to numeric
#Transform the Data
DT <- filter(DT, DT$Date == "1/2/2007" | DT$Date == "2/2/2007")                 ##Filter data by dates of interest
DT$DateTime <- strptime(paste(DT$Date, DT$Time, sep = " "),                     ##create a Var timestamp Date+Time
                        "%d/%m/%Y %H:%M:%S")

DT <- cbind(DT[,10], DT[3:9])                                                   #Remove Date and Time and reorginize VAR Date+Time
Cnames <- colnames(DT)
Cnames[1] <- "DateTime"                                                         ##Rename Var "DateTime"
colnames(DT) <- Cnames

#Load the Data:
outputFilePath <- "../exdata_data_household_power_consumption/Power_Consumption_20170201_48h.csv"
write.csv(DT,file = outputFilePath, row.names = FALSE)

# Loading Tidy Data Set:

Data <- read.csv(outputFilePath, header = TRUE, colClasses = c("character",rep("numeric", 7)))

Data$DateTime <- strptime(DT$DateTime, format = "%Y-%m-%d %H:%M:%S")            ##create a Var timestamp Date+Time