#### Load data ####

unzip(zipfile="exdata_data_NEI_data.zip", exdir=as.character(getwd()))

NEI<-readRDS("summarySCC_PM25.rds",)
SCC<-readRDS("Source_Classification_Code.rds")

#### Question 3 ####
#Of the four types of sources indicated by the type
#(point, nonpoint, onroad, nonroad) variable, which of these 
#four sources have seen decreases in emissions from 1999–2008 for 
#Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#### Subset for Balmore, Myrlyn ####

baltimoreNEI<- NEI[NEI$fips == "24510",]

#### Calculate sums by type ####

bmoretypetotal<-aggregate(Emissions~year + type, baltimoreNEI, sum)

#### Install ggplot2 and load ####

install.packages("ggplot2")
library(ggplot2)

#### Plot 3 ####

png("project2plot3.png")
g<-ggplot(bmoretypetotal, aes(year,Emissions,color=type))
p<- g + geom_point()+
        geom_smooth(method="lm",se=FALSE)+
        xlab("year")+
        ylab(expression("Total PM"[2.5]*"Emissions (tons)"))
        
print(p)
dev.off()







