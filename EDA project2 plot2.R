#### Load data ####

unzip(zipfile="exdata_data_NEI_data.zip", exdir=as.character(getwd()))

NEI<-readRDS("summarySCC_PM25.rds",)
SCC<-readRDS("Source_Classification_Code.rds")

#### Question 2 ####
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == 24510) from 1999 
#to 2008? Use the base plotting system to make a plot answering this question.

#### Subset for Balmore, Myrlyn ####

baltimoreNEI<- NEI[NEI$fips == "24510",]

#### Caluculate totals for b'more by year ####

baltimoretotal<-aggregate(Emissions~year,baltimoreNEI,sum)

#### plot charm city totals ####

png("project2plot2.png")
plot(baltimoretotal$year,
     baltimoretotal$Emissions,
     xlab="Years",
     ylab=expression("Total PM"[2.5]*"  Emissions (tons)"),
     pch=19)
trend<- lm(Emissions~year,data=baltimoretotal)
abline(trend)
dev.off()

