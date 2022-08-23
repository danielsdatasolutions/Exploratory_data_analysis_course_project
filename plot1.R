# Uploading data
data <- "Desktop/Datasets/household_power_consumption.txt"
power_data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Creating plot1
global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
