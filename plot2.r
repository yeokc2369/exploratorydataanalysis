##  Prepare a line graph based on the data for Global Active Power
##  for the dates 1st and 2nd Feb 2007

##  read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
             colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")

##  filter data to subset for only dates 1st and 2nd Feb 2007
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

##  re-format the Date and Time columns
data1 <- transform(data1, Date = as.Date(data1$Date, format = "%d/%m/%Y"), 
                        Time = strptime(paste(data1$Date, data1$Time), 
                                    format = "%d/%m/%Y %H:%M:%S"))

##  activate the PNG graphics device to save output as a file called plot2.png
png("plot2.png",  width = 480, height = 480, units = "px")

##  now prepare the line graph
plot(data1$Time, data1$Global_active_power, type = "l", pch = NA, lwd = 1, xlab = "", 
     ylab = "Global Active Power (kilowatts)", ylim = range(data1$Global_active_power))

##  finally, close the PNG graphics device
dev.off()