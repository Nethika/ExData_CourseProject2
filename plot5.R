###############################################
# Nethika Suraweera
# Coursera: Exploratory Data Analysis 
# Course Project 2
# 08/13/2017
# plot 5
###############################################

#rm(list = ls())
library(ggplot2)

####### Download data #######
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile='data') 
unzip ("data", exdir = "./")

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Create Plot 5 ######
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
########################
# subset for Baltimore
baltimore_emissions <- NEI[NEI$fips=="24510",]
# subset for motor vehicle Emmissions
baltimore_motorV<- baltimore_emissions[which(baltimore_emissions$SCC %in% SCC[grep("*vehicle*|*motor vehicle*|*motorcycles*|*highway veh*",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
#plot
g<-ggplot(baltimore_motorV,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+geom_point(stat = "summary",fun.y="sum")+scale_x_continuous(breaks = c(1999, 2002, 2005,2008))+ labs(title="PM2.5 Emissions from Motor Vehicles in Baltimore City, Maryland.",y= "PM2.5 Emissions (Tons)",x="Year")

dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()

print("plot5.png is created")

#### Answer ####
## In Baltimore City, PM2.5 emissions from motor vehicle sources has decreased from 1999–2008.
