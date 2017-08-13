###############################################
# Nethika Suraweera
# Coursera: Exploratory Data Analysis 
# Course Project 2
# 08/13/2017
# plot 1
###############################################

#rm(list = ls())

####### Download data #######
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile='data') 
unzip ("data", exdir = "./")

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Create Plot 1 ######
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
########################

# Aggregate by sum 
aggSum <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (aggSum$Emissions)/10^6,
  names.arg=aggSum$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)
dev.off()
print("plot1.png is created")

#### Answer ####
## Total emissions from PM2.5 have decreased in the United States from 1999 to 2008.