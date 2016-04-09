###########################################################################
## This script is written for Exploratory Analysis Course Project
## Week 1 Assignment - plot 2
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

#convert the Date and Time variables to Date/Time classes  
strptime (hpcdata$Time, format = "%H:%M:%S") 
hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y") 

## Column that contains a calendar date and time, join $Date + $Time 
hpcdata$datetime <- as.POSIXct (paste(hpcdata$Date, hpcdata$Time)) 
 
## Plot2
# set the filename
png("plot2.png", width=480, height=480)

# plot the graph
plot (hpcdata$Global_active_power ~ hpcdata$datetime,  
      type="l",  
      ylab="Global Active Power (kilowatts)",  
      xlab="") 

# close the device
dev.off()
