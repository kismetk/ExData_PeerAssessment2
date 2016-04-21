# Import the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge dataset
NewData <- merge(NEI, SCC, by="SCC")

# Subset all data in the Baltimore City, Maryland
Baltimore <- subset(NewData, NewData$fips == "24510")

#5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Subset all data from motor vehicle sources
MatchMotor <- subset(Baltimore, Baltimore$type =="ON-ROAD")

MotorEmission <- tapply(MatchMotor$Emissions, MatchMotor$year, sum)

# Making the Plot
png(filename = "plot5.png", width=1000, height=600)

barplot(MotorEmission, 
        main = "Motor Vehicle sources changed from 1999-2008 in Baltimore City", 
        xlab = "Years",
        ylab = "Total Emission", 
        col="red")

dev.off()
