# Uploading data
data <- "Desktop/Datasets/household_power_consumption.txt"
power_data <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Converting variables for use in plot
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_data$Global_active_power)
sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering3 <- as.numeric(subset_data$Sub_metering_3)

# Creating plot
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
