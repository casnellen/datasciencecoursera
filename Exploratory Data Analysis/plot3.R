# Read in the data

dataZip <- "exdata_data_household_power_consumption.zip"

dataPath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
if (!file.exists(dataPath)) {
  unzip(dataZip)
}

data <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dates <- strptime(paste(dateData$Date, dateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1 <- as.numeric(dateData$Sub_metering_1)
sub2 <- as.numeric(dateData$Sub_metering_2)
sub3 <- as.numeric(dateData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dates, sub1, type="l", xlab="", ylab="Energy sub metering")
lines(dates, sub2, type = "l", col="red")
lines(dates, sub3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()