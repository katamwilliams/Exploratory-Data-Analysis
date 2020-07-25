#### Load data ####

unzip(zipfile="exdata_data_NEI_data.zip", exdir=as.character(getwd()))

NEI<-readRDS("summarySCC_PM25.rds",)
SCC<-readRDS("Source_Classification_Code.rds")

#### Question 1 ####
# Have total emissions from PM2.5 decreased in the 
# United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each 
# of the years 1999, 2002, 2005, and 2008.

#### Calculate total PM2.5 emissions for each year ####

totalemissions<- aggregate(Emissions ~ year, NEI, sum)

#### Plot PM2.5 emissions for each year ####

png("project2plot1.png")
plot(totalemissions$year,
     totalemissions$Emissions,
     pch=19,
     ylab= expression("Total PM" [2.5]* " Emisions (tons)"),
     xlab="Year")
trend<-lm(Emissions~year, data=totalemissions)
abline(trend)
dev.off()
