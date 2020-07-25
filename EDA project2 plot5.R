#### Load data ####

unzip(zipfile="exdata_data_NEI_data.zip", exdir=as.character(getwd()))

NEI<-readRDS("summarySCC_PM25.rds",)
SCC<-readRDS("Source_Classification_Code.rds")

#### Question 4 ####
#How have emissions from motor vehicle sources changed from 1999–2008 
#in Baltimore City

#### Subset for Balmore, Myrlyn ####

bmoreNEI<- NEI[NEI$fips == "24510",]

#### Subset for ON-ROAD source ####

bmorecarNEI<- bmoreNEI[NEI$type == "ON-ROAD",]

#### Calculate Sum for balt cars by year ####

bmorecartotal<- aggregate(Emissions~year, bmorecarNEI, sum)

#### PLot 5 ####

library(ggplot2)

png("project2plot5.png")
g<- ggplot(bmorecartotal, aes(year,Emissions))
p<- g+geom_point()+
        geom_smooth(method="lm")+
        xlab("years")+
        ylab(expression("Total PM"[2.5]*"  Emissions (tons)"))
print(p)        
dev.off()        
        
        
        
        
        
        