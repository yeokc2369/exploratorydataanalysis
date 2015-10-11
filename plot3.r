##  Prepare line graphs for the three energy sub meterings 
##  based on the data for Global Active Power for the dates 1st and 2nd Feb 2007

##  read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
             colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")

##  filter data to subset for only dates 1st and 2nd Feb 2007
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

##  re-format the Date and Time columns
data1 <- transform(data1, Date = as.Date(data1$Date, format = "%d/%m/%Y"), 
                        Time = strptime(paste(data1$Date, data1$Time), 
                                    format = "%d/%m/%Y %H:%M:%S"))

##  activate the PNG graphics device to save output as a file called plot3.png
png("plot3.png",  width = 480, height = 480, units = "px")

##  now prepare the line graphs and include a legend to the plot
plot(data1$Time, data1$Sub_metering_1, type = "l", pch = NA, lwd = 1, xlab = "", 
     ylab = "Energy sub metering", ylim = range(data1$Sub_metering_1))
lines(data1$Time, data1$Sub_metering_2, pch = NA, lwd = 1, col = "red")
lines(data1$Time, data1$Sub_metering_3, pch = NA, lwd = 1, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
     col = c("black", "red", "blue"))

##  finally, close the PNG graphics device
dev.off()
