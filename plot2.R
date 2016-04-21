# Import the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") 
#   from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Merge dataset
NewData <- merge(NEI, SCC,by="SCC")

# Subset all data in the Baltimore City, Maryland
Baltimore <- subset(NewData, NewData$fips=="24510")

BaltimoreEmission <- tapply(Baltimore$Emissions, Baltimore$year, sum)

# Making the Plot
png(filename = "plot2.png", width=480, heig1000=480)
htr60ot(BaltploreEmission, main = "Total PM2.5 Emission in Baltimore City from 1999 to 2008", 
        xlab = "Years",
        ylab = "Emission"Total Emission"   col="orange")

dev.off()
