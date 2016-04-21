# Import the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge dataset
NewData <- merge(NEI, SCC, by="SCC")

#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
#   sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater
#   changes over time in motor vehicle emissions?

Compare <- subset(NewData, (NewData$fips=="24510" | NewData$fips=="06037") & NewData$type=="ON-ROAD")

aggregateCompare <- aggregate(Emissions ~ year + fips, Compare, sum)

aggregateCompare$fips[aggregateCompare$fips=="24510"] <- "Baltimore, MD"
aggregateCompare$fips[aggregateCompare$fips=="06037"] <- "Los Angeles, CA"

# Making the Plot
png(filename = "plot6.png", width=1000, height=600)

library(ggplot2)

a <- ggplot(aggregateCompare, aes(factor(year), Emissions, fill=fips))

# label 

a + facet_grid(.~fips) +
  geom_bar(stat = "identity")+
  scale_shape_discrete(name  ="Payer",
                         breaks=c("Female", "Male"),
                         labels=c("Woman", "Man"))+
  theme(legend.position='none')+
  xlab("Years")+
  ggtitle("Compare PM2.5 Emission from motor vehicle sources from both cities")

dev.off()


