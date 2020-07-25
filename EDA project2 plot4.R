#### Load data ####

unzip(zipfile="exdata_data_NEI_data.zip", exdir=as.character(getwd()))

NEI<-readRDS("summarySCC_PM25.rds",)
SCC<-readRDS("Source_Classification_Code.rds")

#### Question 4 ####
#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999–2008?

#### merge NEI and SCC ####

NEISCC<-merge(NEI,SCC,by="SCC")

#### subset for coal ####

coalmatches<- grepl("coal", NEISCC$Short.Name,ignore.case=TRUE)
coalsubset<- NEISCC[coalmatches,]

coaltotal<- aggregate(Emissions~year,coalsubset, sum)

#### plot 4 ####

library(ggplot2)

png("project2plot4.png")
g<- ggplot(coaltotal,aes(year,Emissions))
p<- g+ geom_point()+
        geom_smooth(method="lm")+
        xlab("year") +
        ylab(expression("Total PM"[2.5]*"Emissions (tons)"))
print(p)
dev.off()


