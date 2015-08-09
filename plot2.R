## Coursera 'Exploratory Data Analysis' course project 1, August 2015
## plot2.R
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
## 3) Create a line plot of "Global Active Power (kilowatts)" vs dateTime with
##      the col = "Black" and no main title
## 4) Create a 480px X 480px PNG file containing the graphic and save it as "plot2.png"
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


# Create Plot
par(mar= c(4, 4, 2, 1), pch=22)
plot(householdPowerFeb2007$Global_active_power, type="l", xaxt="n", col = "Black", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
# draw an axis on the bottom
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)

# Save graph as PNG file
dev.copy(png,'plot2.png',width = 480, height =480, units = "px", bg = "white")
dev.off()
