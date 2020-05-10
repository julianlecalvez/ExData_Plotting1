setwd("~/Documents/data-sciences/Coursera/DataScienceJHU/Module4/assignment-week1/ExData_Plotting1")


# Load data 
hhpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.string = '?')

# convert Date variable and add DateTime with combined dates and times 
hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), "%Y-%m-%d %H:%M:%S") 
hhpc$Time <- NULL

# subset the dataframe to extract only observations between 2007-02-01 and 2007-02-02
hhpc_subset <- subset(hhpc, DateTime >= '2007-02-01 00:00:00' & DateTime <= '2007-02-02 23:59:59')

# Plot 4 : Variables comparison per DateTime 
par(bg = "transparent")
par(mfrow = c(2, 2)) # setup the device to be 2 by 2  

with(hhpc_subset, {
  # 1st graph 
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  # 2nd graph 
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  # 3rd graph 
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering") 
  lines(DateTime, Sub_metering_2, type = "l", col = "red")
  lines(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, box.lty = 0, pt.cex = 1, cex=0.7)
  # 4th graph 
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# copy graph to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()



