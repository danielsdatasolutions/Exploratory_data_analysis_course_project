# Uploading data
data <- "Desktop/Datasets/household_power_consumption.txt"
power_data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Converting variables for use in plot
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_data$Global_active_power)

# Creating plot
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
