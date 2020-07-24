library(readr)

##Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

##Extracting only relevant data
data$Date <- strptime(data$Date, "%d/%m/%Y")
data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
data$Time <- format(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")

##Changing values from char to double to plot histogram
data$Sub_metering_1 <- parse_double(data$Sub_metering_1)
data$Sub_metering_2 <- parse_double(data$Sub_metering_2)
#data$Sub_metering_3 <- parse_double(data$Sub_metering_3)

##Plotting the figure
png(filename = "plot3.png", height = 480, width = 480)
plot(as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
lines(as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Sub_metering_2, col = "orange")
lines(as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("red", "orange", "blue"), lwd = c(1, 1, 1))
dev.off()