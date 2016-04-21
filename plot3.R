# Import the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge dataset
NewData <- merge(NEI, SCC,by="SCC")

# Subset all data in the Baltimore City, Maryland
Baltimore <- subset(NewData, NewData$fips=="24510")

#3. NEI, SCC, by= "SCC"Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
#   which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#   Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
#   plot answer this question.

library(ggplot2)

# Making the Plot
png(filename = "plot3.png", width=480 = 1000eht=480 = 60ag

egatetype <- aggregate(Emissions ~ year + type, Baltimore, sum)

g <- ggplot(aggregatetype, aes(year,Emissions, color=type))

g + geom_line()+
  xlab("Years")+
  ylab("Total Emissions")
  ggtitle("Total PM2.5 Emission in Baltimore City, Maryland from 1999 to 2008")

dev.off()
