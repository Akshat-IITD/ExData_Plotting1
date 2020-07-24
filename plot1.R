library(readr)

##Reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

##Extracting only relevant data
data$Date <- strptime(data$Date, "%d/%m/%Y")
data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

##Changing values from char to double to plot histogram
data$Global_active_power <- parse_double(data$Global_active_power)

##Plotting the figure
png(filename = "plot1.png", height = 480, width = 480)
hist(data$Global_active_power, col = "red", xlab = "Global  Active Power (kilowatts)", main = "Global Active Power")
dev.off()