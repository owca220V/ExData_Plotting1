# This script is part of the Peer-graded Assignment: Course Project 1 of the Exploratory Data Analysis course
# This script creates the first plot and stores it in plot1.PNG

# The script assumes 'household_power_consumption.txt' resides in the current working directory
# If it does not, the script will attempt to download and unzip the file into the current working directory

if (!file.exists("household_power_consumption.txt")) { 
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename <- "household_power_consumption.zip"
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

# save plot as 480x480 PNG file
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

# setlocale to "English" to get days of the week in English
Sys.setlocale("LC_TIME", "English")

# create Plot 4
par(mfcol = c(2,2))
plot( HPC$Time, HPC$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot( HPC$Time, HPC$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", col = "black")
points(HPC$Time,HPC$Sub_metering_2,col = "red",type = "l")
points(HPC$Time,HPC$Sub_metering_3,col = "blue",type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), bty = "n")
plot( HPC$Time, HPC$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot( HPC$Time, HPC$Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab = "datetime")

# close/save file
dev.off()

