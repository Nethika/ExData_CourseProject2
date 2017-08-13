###############################################
# Nethika Suraweera
# Coursera: Exploratory Data Analysis 
# Course Project 2
# 08/13/2017
# plot 4
###############################################

#rm(list = ls())
library(ggplot2)

####### Download data #######
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile='data') 
unzip ("data", exdir = "./")

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Create Plot 4 ######
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
########################

# subset for Coal Emmissions
NEI_coal<- NEI[which(NEI$SCC %in% SCC[grep("*coal*",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
#plot
g<-ggplot(NEI_coal,aes(year,Emissions/10^3))
g+geom_line(stat = "summary",fun.y="sum")+geom_point(stat = "summary",fun.y="sum")+scale_x_continuous(breaks = c(1999, 2002, 2005,2008))+ labs(title="PM2.5 Emissions from Coal Combustion in the United States",y= "PM2.5 Emissions (10^3 Tons)",x="Year")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

print("plot4.png is created")

#### Answer ####
## Across the United States, PM2.5 emissions from coal combustion-related sources has decreased from 1999–2008.
