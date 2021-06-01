source("Load_file.R")

png(filename = "plot3.png", width = 480, height = 480, units = "px")            ## Open graphic Dev png type
plot(Data$DateTime, Data$Sub_metering_1, type = "n", xlab = "",                 ## Crreate an empty labeled graph
     ylab = "Energy sub metering")
lines(Data$DateTime, Data$Sub_metering_1, col = "black")                        ## Add Sub_mettering_1 Var in black color
lines(Data$DateTime, Data$Sub_metering_2, col = "red")                          ## Add Sub_mettering_2 Var in red color
lines(Data$DateTime, Data$Sub_metering_3, col = "blue")                         ## Add Sub_mettering_3 Var in blue color
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

dev.off()                                                                       ## close the graph device png
