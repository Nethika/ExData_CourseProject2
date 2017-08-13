###############################################
# Nethika Suraweera
# Coursera: Exploratory Data Analysis 
# Course Project 2
# 08/13/2017
# plot 3
###############################################

#rm(list = ls())
library(ggplot2)

####### Download data #######
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile='data') 
unzip ("data", exdir = "./")

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Create Plot 3 ######
## which of the four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
########################

# subset for Baltimore
baltimore_emissions <- NEI[NEI$fips=="24510",]

#plot
g<-ggplot(baltimore_emissions,aes(year,Emissions,color=type))
g+geom_line(stat = "summary",fun.y="sum")+geom_point(stat = "summary",fun.y="sum")+ scale_x_continuous(breaks = c(1999, 2002, 2005,2008))+labs(title="Four Sources of PM2.5 Emisions for Baltimore City", y="PM2.5 Emissions (Tons) ",x="Year")+scale_colour_discrete(name = "Source Type")

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

print("plot3.png is created")

#### Answer ####
## In the Baltimore City, Maryland, the PM2.5 Emmisions Source types ON-ROAD, NON-ROAD and NONPINT have decreased from 1999 to 2008.
## Emmisions from the source type "POINT" has been increases from 1999 to 2005 and again decreased in 2008. Not much overall change is observed for type "POINT".