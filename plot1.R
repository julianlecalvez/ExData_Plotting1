setwd("~/Documents/data-sciences/Coursera/DataScienceJHU/Module4/assignment-week1/ExData_Plotting1")

# Load data 
hhpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.string = '?')

# convert Date variable and add DateTime with combined dates and times 
hhpc$Date <- as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), "%Y-%m-%d %H:%M:%S") 
hhpc$Time <- NULL

# subset the dataframe to extract only observations between 2007-02-01 and 2007-02-02
hhpc_subset <- subset(hhpc, DateTime >= '2007-02-01 00:00:00' & DateTime <= '2007-02-02 23:59:59')

# Plot 1 : Global Active Power 
par(bg = "transparent")
hist(hhpc_subset$Global_active_power, 
     main = "Global Active Power",  # put a title to the graph
     xlab = "Global Active Power (kilowatts)",  # name the X axe 
     col = "red") 


# copy graph to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()





