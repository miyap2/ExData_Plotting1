###########################################################################
## This script is written for Exploratory Analysis Course Project
## Week 1 Assignment - plot 1
###########################################################################
#
# Load the necessary library for fread
library(data.table)
#
# Assumption: you have unzipped the data file for the assignment in your working directory.
filename = "household_power_consumption.txt"

# Read the data file
hpcdata <- fread(filename, header=TRUE, sep=";", na.strings = "?")

## Extracting only data for 2007-02-01 and 2007-02-02
hpcdata <- subset(hpcdata, hpcdata$Date=="1/2/2007" | hpcdata$Date=="2/2/2007") 

## Plot1
# set the filename
png("plot1.png", width=480, height=480)

# plot the graph
hist(hpcdata$Global_active_power,  
      col="red",  
      main="Global Active Power",  
      xlab="Global Active Power (kilowatts)")

# close the device
dev.off()
