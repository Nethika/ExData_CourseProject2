###############################################
# Nethika Suraweera
# Coursera: Exploratory Data Analysis 
# Course Project 2
# 08/13/2017
# plot 2
###############################################

#rm(list = ls())

####### Download data #######
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile='data') 
unzip ("data", exdir = "./")

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Create Plot 2 ######
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008?
########################

# Subset NEI data by Baltimore.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum for Baltimore
aggSumBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  aggSumBaltimore$Emissions,
  names.arg=aggSumBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From Baltimore City, Maryland"
)

dev.off()
print("plot2.png is created")

#### Answer ####
## Total emissions from PM2.5 have decreased in the Baltimore City, Maryland from 1999 to 2008.