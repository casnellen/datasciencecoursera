## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

baltimoreData <- subset(NEI, fips=="24510")
baltTotalByYear <- aggregate(Emissions ~ year, baltimoreData, sum)
baltTotalByYear$city <- "Baltimore City"
losAngelesData <- subset(NEI, fips=="06037")
losTotalByYear <- aggregate(Emissions ~ year, losAngelesData, sum)
losTotalByYear$city <- "Los Angeles County"
bothData <- rbind(baltTotalByYear,losTotalByYear)

library(ggplot2)

png("plot6.png", width=640, height=480)

g <- ggplot(data=bothData, aes(x=factor(year), y=Emissions, group=city, colour=city)) +
  geom_line() +
  geom_point() +
  xlab("Year") +
  ylab("PM 2.5 Emission") +
  ggtitle('PM 2.5 Emissions for LA/Baltimore from 1999 to 2008')

print(g)
dev.off() 

