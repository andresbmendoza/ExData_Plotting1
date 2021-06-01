source("Load_file.R")                                                           #Load Tidy Dataset

png(filename = "plot2.png", width = 480, height = 480, units = "px")            ## Open Graphic device "png file"
plot(Data$DateTime, Data$Global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)")                       ## Labeling Y axis
dev.off()                                                                       ## Close Graphic Device
