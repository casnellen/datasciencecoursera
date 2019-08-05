## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008?
baltimoreData = subset(NEI, fips=="24510")

totalByYear <- aggregate(Emissions ~ year, baltimoreData, sum)

png('plot2.png')
plot(as.character(totalByYear$year),
     totalByYear$Emissions,
     xlab = 'Years',
     ylab = 'Total PM2.5 Emission',
     main = 'PM2.5 Emission From 1999 - 2008 in Baltimore, MD',
     type = 'b')
dev.off()