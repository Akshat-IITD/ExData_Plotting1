library(readr)

##Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

##Extracting only relevant data
data$Date <- strptime(data$Date, "%d/%m/%Y")
data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
data$Time <- format(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")

##Changing values from char to double to plot histogram
data$Global_active_power <- parse_double(data$Global_active_power)

##Plotting the figure
png(filename = "plot2.png", height = 480, width = 480)
plot(as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()