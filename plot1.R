# This script is part of the Peer-graded Assignment: Course Project 1 of the Exploratory Data Analysis course
# This script creates the first plot and stores it in plot1.PNG

# The script assumes 'household_power_consumption.txt' resides in the current working directory
# If it does not, the script will download and unzip the file into the current working directory

if (!file.exists("housegold_power_consumption.txt")) { 
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename <- "housegold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
  unzip(filename) 
}

# Read in the required part of the dataset

