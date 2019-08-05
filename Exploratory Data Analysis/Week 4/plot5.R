## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
baltimoreData = subset(NEI, fips=="24510"& NEI$type=="ON-ROAD")

totalByYear <- aggregate(Emissions ~ year, baltimoreData, sum)

png('plot5.png')
plot(as.character(totalByYear$year),
     totalByYear$Emissions,
     xlab = 'Years',
     ylab = 'Total PM2.5 Emission',
     main = 'PM2.5 Emission for Motor Vehicles From 1999 - 2008 in Baltimore',
     type = 'b')
dev.off()