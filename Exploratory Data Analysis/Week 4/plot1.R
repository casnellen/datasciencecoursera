## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

totalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
plot(as.character(totalByYear$year),
     totalByYear$Emissions,
     xlab = 'Years',
     ylab = 'Total PM2.5 Emission',
     main = 'PM2.5 Emission From 1999 - 2008',
     type = 'b')
dev.off()