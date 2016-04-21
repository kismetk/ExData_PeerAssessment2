# Import the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#   Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
#   for each of the years 1999, 2002, 2005, and 2008.

# Emissions in Kilotons
NEI$EmissionsK <- NEI$Emissions/1000

EmissionTotal <- tapply(NEI$EmissionsK, NEI$year, sum)

# Making the Plot
png(filename = "plot1.png", width=1000, height=600)

barplot(EmissionTotal, main="Total PM2.5 Emission from 1999 to 2008", 
        xlab = "Years",
        ylab = "Total Emission (Kilotons)", 
        col = "green")

dev.off()
