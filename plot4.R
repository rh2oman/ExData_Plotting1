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

y <- paste (subsetconsumption$Date, subsetconsumption$Time)

## Open PDF device; create 'plot4.png' in my working directory
## Set the Height and Width of the Plot
png(file="./plot4.png",width=480,height=480)
## Set the page to have four plots, two on the top, two on the bottom
par(mfrow = c(2,2))
## Plot 1
plot(strptime(y, "%d/%m/%Y %H:%M:%S"), subsetconsumption$Global_active_power, type="l", ## set type to line
     xlab="", ## blank x lable
     ylab="Global Active Power")
## Plot 2
plot(strptime(y, "%d/%m/%Y %H:%M:%S"), subsetconsumption$Voltage, type="l", ## set type to line
     xlab="datetime", ## blank x lable
     ylab="Voltage")
## Plot 3
plot(strptime(y, "%d/%m/%Y %H:%M:%S"), subsetconsumption$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(strptime(y, "%d/%m/%Y %H:%M:%S"),subsetconsumption$Sub_metering_2,col="red")
lines(strptime(y, "%d/%m/%Y %H:%M:%S"),subsetconsumption$Sub_metering_3,col="blue")
legend("topright", 
       lty=c(1,1,1),
       lwd=c(1,1,1),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       bty = "n"
      )
## Plot4
plot(strptime(y, "%d/%m/%Y %H:%M:%S"), subsetconsumption$Global_reactive_power, type="l", ## set type to line
                                                                                xlab="datetime", ## blank x lable
                                                                                ylab="Global Reactive Power")
## Close the png file device
dev.off() 
