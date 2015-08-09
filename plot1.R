## Coursera 'Exploratory Data Analysis' course project 1, August 2015
## plot1.R
##
## Student: TallDavid
## Data source & description:
##   This assignment uses data from the UC Irvine Machine Learning Repository.
##   We will be using the “Individual household electric power consumption Data Set”:
##   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##
## Description: Measurements of electric power consumption in one household with a one-minute
##  sampling rate over a period of almost 4 years. Different electrical quantities and some
##  sub-metering values are available.
##
## The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
##
## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy).
##      It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave
##      (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds
##      to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds
##      to an electric water-heater and an air-conditioner.

## This R script performs the following actions:
## 1) Read data set, convert date to R Date/Time classes.  Note: Missing values are coded as "?"
## 2) Filter (subset) the data to retain only the dates: 2007-02-01 and 2007-02-02
## 3) Create a histogram of "Global Active Power (kilowatts)" vs "Frequency" with
##      the col = "Red" and main title "Global Active Power"
## 4) Create a 480px X 480px PNG file containing the graphic and save it as "plot1.png"
#
# Load libraries
library(dplyr)
library(lubridate)

# Read dataset
householdPower <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, na.strings ="?", stringsAsFactors= FALSE)

# Convert dates & subset
householdPowerFeb2007 <- householdPower %>%
    filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(dateTime = dmy_hms(paste(Date,Time)))


# Create histogram
hist(householdPowerFeb2007$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
par(mar= c(4, 4, 2, 1))

# Save graph as PNG file
dev.copy(png,'plot1.png',width = 480, height =480, units = "px", bg = "white")
dev.off()
