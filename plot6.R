###############################################
# Nethika Suraweera
# Coursera: Exploratory Data Analysis 
# Course Project 2
# 08/13/2017
# plot 6
###############################################

#rm(list = ls())
library(ggplot2)

####### Download data #######
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile='data') 
unzip ("data", exdir = "./")

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Create Plot 6 ######
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County.
## Which city has seen greater changes over time in motor vehicle emissions?
########################

# subset for motor vehicle Emmissions
motorV<- NEI[which(NEI$SCC %in% SCC[grep("*vehicle*|*motor vehicle*|*motorcycles*|*highway veh*",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
# two cities : LA & Baltimore
LA_Bal <- c("24510","06037")
# subset for two cities
motorV_LA_Bal<-subset(motorV,fips %in% LA_Bal)

#plot
g<-ggplot(motorV_LA_Bal,aes(year,Emissions,color=fips))
g+geom_line(stat = "summary",fun.y="sum")+geom_point(stat = "summary",fun.y="sum")+scale_x_continuous(breaks = c(1999, 2002, 2005,2008))+ labs(title="PM2.5 Emissions from Motor Vehicles in Baltimore City & LA",y= "PM2.5 Emissions (Tons)",x="Year")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))

dev.copy(png, file="plot6.png", width=480, height=480)
dev.off()

print("plot6.png is created")

#### Answer ####
## Baltimore City has much less PM2.5 emissions from motor vehicle sources than in LA. Also Baltimore City emmision has decreased from 1999–2008.
## LA's PM2.5 emissions from motor vehicle sources has increased from 1999 to 2005, and then decreased from 2005 to 2008. But still the 2008 figure is higher than in 1999.
