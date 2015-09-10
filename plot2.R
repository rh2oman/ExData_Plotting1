setwd("/Users/waterman/Documents/Data Science Courses/Exploratory Data Analysis/Project1/ExData_Plotting1")

## load the Electric Power Consuption Data into a dataframe
allconsumption <- read.table ("./data/household_power_consumption.txt", header=TRUE, fill=T, sep = ";", na.strings ="?")

## create the DateTime variable from Date and Time variables in POSIXlt format
x <- paste (allconsumption$Date, allconsumption$Time)
allconsumption$DateTime <- as.Date(strptime(x, "%d/%m/%Y %H:%M:%S"))

## subset data based on new DateTime variable
library(dplyr)
subsetconsumption <- filter(allconsumption, DateTime >= as.Date("2007-02-01 00:00:00"), 
                                            DateTime < as.Date("2007-02-03 00:00:00"))

## Open PDF device; create 'Plot2.png' in my working directory
## Set the Height and Width of the Plot
png(file="./plot2.png",width=480,height=480)
## Create a combined date and time variable to pass to the strptime function
y <- paste (subsetconsumption$Date, subsetconsumption$Time)
## Create plot
plot(strptime(y, "%d/%m/%Y %H:%M:%S"), subsetconsumption$Global_active_power, type="l", ## set type to line
                                                                              xlab="", ## blank x lable
                                                                              ylab="Global Active Power (kilowatts)")
## Close the png file device
dev.off() 





