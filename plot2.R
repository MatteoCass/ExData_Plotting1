plot2 <- function(){
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
        
        # make plot and save file
        png(filename = "plot2.png",width=480,height=480)
        plot(data_red$Global_active_power,type="l",xaxt="n",xlab="",main="",ylab="Global active power (kilowatts)")
        axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"), col.axis="black")
        dev.off()
        
}