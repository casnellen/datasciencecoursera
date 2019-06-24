# Read in the data

dataZip <- "exdata_data_household_power_consumption.zip"

dataPath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
if (!file.exists(dataPath)) {
  unzip(dataZip)
}

data <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dateData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(dateData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()