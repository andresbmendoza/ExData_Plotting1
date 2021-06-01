source("Load_file.R")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))

## position [1,1]
plot(Data$DateTime, Data$Global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power")                       ## Labeling Y axis
## position [2,1]
plot(Data$DateTime, Data$Sub_metering_1, type = "n", xlab = "",                 ## Crreate an empty labeled graph
     ylab = "Energy sub metering")
lines(Data$DateTime, Data$Sub_metering_1, col = "black")                        ## Add Sub_mettering_1 Var in black color
lines(Data$DateTime, Data$Sub_metering_2, col = "red")                          ## Add Sub_mettering_2 Var in red color
lines(Data$DateTime, Data$Sub_metering_3, col = "blue")                         ## Add Sub_mettering_3 Var in blue color
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

## position [1,2]
plot(Data$DateTime, Data$Voltage, type = "l", col = "black",
     xlab = "", ylab = "Voltage")                       ## Labeling Y axis

## position [2,2]
plot(Data$DateTime, Data$Global_reactive_power, type = "l", col = "black",
     xlab = "", ylab = "Global_reactive_power")                                 ## Labeling Y axis
dev.off()
