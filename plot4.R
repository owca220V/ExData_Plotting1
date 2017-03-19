# This script is part of the Peer-graded Assignment: Course Project 1 of the Exploratory Data Analysis course
# This script creates the first plot and stores it in plot1.PNG

# The script assumes 'household_power_consumption.txt' resides in the current working directory
# If it does not, the script will download and unzip the file into the current working directory

if (!file.exists("household_power_consumption.txt")) { 
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename <- "housegold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
  unzip(filename) 
}

# Read in the required part of the dataset

# todo: read only data from the dates 2007-02-01 and 2007-02-02
HPC <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# convert Date & Time from character/factor to POSIX time
HPC$Time <- strptime(paste(HPC$Date,HPC$Time),"%d/%m/%Y %H:%M:%S")
HPC$Date <- as.Date(HPC$Date,"%d/%m/%Y")

# select data from 2007-02-01 and 2007-02-02
HPC <- subset(HPC, HPC$Date >= "2007-02-01" & HPC$Date <= "2007-02-02")


# create Plot 4