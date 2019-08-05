## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

library(ggplot2)
# Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question
baltimoreData = subset(NEI, fips=="24510")

totalByYearAndType <- aggregate(Emissions ~ year + type, baltimoreData, sum)

png("plot3.png", width=640, height=480)
g <- qplot(x = year, y = Emissions, data = totalByYearAndType, col = type, facets = . ~ type) + geom_line() +
  labs(title = "PM2.5 Emission From 1999 - 2008 in Baltimore, MD") +
  labs(x = "Year", y = "Tota5 Emission (in tons)") +
  scale_x_continuous(breaks = unique(totalByYearAndType$year))
print(g)
dev.off()
