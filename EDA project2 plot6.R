#### Load data ####

unzip(zipfile="exdata_data_NEI_data.zip", exdir=as.character(getwd()))

NEI<-readRDS("summarySCC_PM25.rds",)
SCC<-readRDS("Source_Classification_Code.rds")

#### Question 6 ####
#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California 
#(fips == "06037). Which city has seen greater changes over time in motor 
#vehicle emissions?


#### Subset for Balmore, Myrlyn ####

bmoreNEI<- NEI[NEI$fips == "24510",]

### Subset for LA ####

laNEI<- NEI[NEI$fips== "06037",]

#### Subset for cars in both data frames ####

bmorecarNEI<- bmoreNEI[bmoreNEI$type == "ON-ROAD",]

lacarNEI<- laNEI[laNEI$type == "ON-ROAD",]

#### Calculate Sums for both cities ####

bmorecartotal<- aggregate(Emissions~year, bmorecarNEI, sum)

lacartotal<- aggregate(Emissions~year,lacarNEI,sum)

#### add location variable ####

bmorecartotal$city<-c("Baltimore","Baltimore","Baltimore","Baltimore")
lacartotal$city<-c("LA","LA","LA","LA")

#### Bind DFs together ####

totals<- rbind(bmorecartotal,lacartotal)

#### Plot 6 ####

library(ggplot2)

png("project2plot6.png")
g<- ggplot(totals,aes(year, Emissions,color=city))
p<- g+ geom_point()+
        xlab("years")+
        ylab(expression("Total PM"[2.5]*"  Emissions (tons)"))+
        geom_smooth(method="lm",se=FALSE)
print(p)
dev.off()




