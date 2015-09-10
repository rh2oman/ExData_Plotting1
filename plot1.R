setwd("/Users/waterman/Documents/Data Science Courses/Exploratory Data Analysis/Project1/ExData_Plotting1")

## load the Electric Power Consuption Data into a dataframe
allconsumption <- read.table ("./data/household_power_consumption.txt", header=TRUE, fill=T, sep = ";")

## create the DataTime variable from Date and Time variables in POSIXlt format
x <- paste (allconsumption$Date, allconsumption$Time)
allconsumption$DateTime <- as.Date(strptime(x, "%d/%m/%Y %H:%M:%S"))

## subset data
library(dplyr)
subsetconsumption <- filter(allconsumption, DateTime >= as.Date("2007-02-01 00:00:00"), 
                                            DateTime < as.Date("2007-02-03 00:00:00"))

subsetconsumption$Global_active_power<-as.numeric(as.character(subsetconsumption$Global_active_power))

## Open PDF device; create 'Plot1.png' in my working directory
## Set the Height and Width of the Plot
png(file="./plot1.png",width=480,height=480)
## Create Histogram
hist(subsetconsumption$Global_active_power, main="Global Active Power",
                                            xlab="Global Active Power (kilowatts)",
                                            col = "red")
## Close the png file device
dev.off() 



