# Import the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge dataset
NewData <- merge(NEI, SCC, by="SCC")

#4. Across the United States, how have emissions from coal combustion-related sources changed 
#   from 1999–2008?

MatchCoal <- grepl("coal", NewData$Short.Name, ignore.case=TRUE)
subsetCoal <- NewData[MatchCoal,]

CoalEmission <- tapply(subsetCoal$Emissions/1000, subsetCoal$year, sum)

# Making the Plot
png(filename = "plot4.png", width = 1000, height = 600)

barplot(CoalEmission, main = "Coal combustion-related sources changed from 1999-2008", 
        xlab = "Years",
        ylab = "Total Emission (Kilotons)",
        col = "blue" )

dev.off()
