## Coursera 'Exploratory Data Analysis' course project 1, August 2015
## plot4.R
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
## 3) Create 4 plots and place them in a 2x2 matrix of plots.
## TopLeft:
##  A line plot of "Global Active Power (kilowatts)" vs dateTime with
##      the col = "Black" and no main title
##
## TopRight:
##  A line plot of Voltage vs. dateTime with an X-axis label of "datetime"
##
## BottomLeft:
##  A line plot of "Energy sub metering" vs dateTime with
##      Sub_metering_1 col = "Black"
##      Sub_metering_2 col = "Red"
##      Sub_metering_3 col = "Blue"
##      and no main title
##
##  BottomRight:
##  A line plot of Global_reactive_power vs. dateTime with an X-axis label of "datetime"
##      and a Y-axis label of "Global_reactive_power"
##
## 4) Create a 480px X 480px PNG file containing the final graphic and save it as "plot4.png"
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

## Write graphs to console
# Create 2x2 matrix to hold the 4 plots
par(mfrow=c(2,2), bg = "White", mar= c(4, 4, 2, 1), pch=22)

## TopLeft:
plot(householdPowerFeb2007$Global_active_power, type="l", xaxt="n", col = "Black", main = "",
     xlab = "", ylab = "Global Active Power")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
## ===================================================================

## TopRight:
plot(householdPowerFeb2007$Voltage, type="l", xaxt="n", col = "Black", main = "",
     xlab = "datetime", ylab = "Voltage")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
## ===================================================================

## BottomLeft:
plot(householdPowerFeb2007$Sub_metering_1, type="l", xaxt="n", col = "Black", main = "",
     xlab = "", ylab = "Energy sub metering")
    lines(householdPowerFeb2007$Sub_metering_2, type="l", col = "Red")
    lines(householdPowerFeb2007$Sub_metering_3, type="l", col = "Blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("Black", "Red","Blue"), lty = 1, xjust = 1)
    axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
## ===================================================================

##  BottomRight:
plot(householdPowerFeb2007$Global_reactive_power, type="l", xaxt="n", col = "Black", main = "",
    xlab = "datetime", ylab = "Global_reactive_power")
    axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
## ===================================================================
## ===================================================================

# Save graphs as PNG file
png(filename = 'plot4.png',width = 480, height =480, units = "px", bg = "white")
    # Create 2x2 matrix to hold the 4 plots
    par(mfrow=c(2,2), bg = "White", mar= c(4, 4, 2, 1), pch=22)

    ## TopLeft:
    plot(householdPowerFeb2007$Global_active_power, type="l", xaxt="n", col = "Black", main = "",
         xlab = "", ylab = "Global Active Power")
    axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
    ## ===================================================================

    ## TopRight:
    plot(householdPowerFeb2007$Voltage, type="l", xaxt="n", col = "Black", main = "",
         xlab = "datetime", ylab = "Voltage")
    axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
    ## ===================================================================

    ## BottomLeft:
    plot(householdPowerFeb2007$Sub_metering_1, type="l", xaxt="n", col = "Black", main = "",
         xlab = "", ylab = "Energy sub metering")
    lines(householdPowerFeb2007$Sub_metering_2, type="l", col = "Red")
    lines(householdPowerFeb2007$Sub_metering_3, type="l", col = "Blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("Black", "Red","Blue"), lty = 1, xjust = 1)
    axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
    ## ===================================================================

    ##  BottomRight:
    plot(householdPowerFeb2007$Global_reactive_power, type="l", xaxt="n", col = "Black", main = "",
         xlab = "datetime", ylab = "Global_reactive_power")
    axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"), las=0)
    ## ===================================================================
dev.off()
