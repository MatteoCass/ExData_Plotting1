plot1 <- function(){
        # set working directory and read data in
        setwd("C:/Users/Matteo/Documents/Courses/04 - Exploratory Data Analysis/R data & Code/Course Project 1")
        data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")
        # subset data for "2007-02-01" and "2007-02-02"
        data_red <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]
        data_red[,3:9] <- sapply(data_red[,3:9],as.numeric)        
        # convert dates and times to Date/Time classes
        library(lubridate)
        data_red$Date <- dmy(data_red$Date)
        data_red$Time <- hms(data_red$Time)

        # make histogram and save file
        png(filename = "plot1.png",width=480,height=480)
        hist(data_red$Global_active_power,col="red",xlab="Global active power (kilowatts)",main="Global active power")
        dev.off()

}