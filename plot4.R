###########################################################################
## This script is written for Exploratory Analysis Course Project
## Week 1 Assignment - plot 4
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
 
## Plot4

# set the filename
png("plot4.png", width=480, height=480)

# set to plot 2x2 graphs
par(mfrow=c(2, 2), 
    mar=c(4, 4, 2, 2), 
    oma=c(0, 0, 1, 0))

# Plot the 4 graphs
with(hpcdata, { ##Upper-Left 
                plot(Global_active_power ~ datetime, 
                     type="l", 
                     ylab="Global Active Power", 
                     xlab="") 
                ##Upper Right 
                plot(Voltage ~ datetime,  
                     type="l", 
                     ylab="Voltage", 
                     xlab="datetime") 
                ##Lower Left 
                plot(Sub_metering_1 ~ datetime, 
                     type="l", 
                     ylab="Energy sub metering", 
                     xlab="") 
                lines(Sub_metering_2 ~ datetime, col="red") 
                lines(Sub_metering_3 ~ datetime, col="blue") 
                legend("topright",  
                       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                       col=c("black", "red", "blue"), 
                       lty=1, 
                       lwd=1, bty="n") 
                ##Lower Right 
                plot(Global_reactive_power ~ datetime, 
                     type="l", 
                     ylab="Global_reactive_power", 
                     xlab="datetime") 
              }) 

# close the device
dev.off() 
