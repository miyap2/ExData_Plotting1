###########################################################################
## This script is written for Exploratory Analysis Course Project
## Week 1 Assignment
###########################################################################
#
library(data.table)
#
# Assumption: you have unzipped the data for the project in your working directory.
# You should have the following as the base data directory, the train and test subdirectories
filename = "household_power_consumption.txt"

data <- fread(filename, header=TRUE, sep=",")

