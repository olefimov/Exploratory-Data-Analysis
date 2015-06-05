plot2 <- function() {
    #Read data
    data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
    
    #subsetting two days only - 1/2/2007 and 2/2/2007
    dat <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
    
    #merging date and time and adding it as a new column to dataframe
    dat$dateTime <- paste(dat$Date,dat$Time)
    
    #convert dateTime to POSIX
    dat$dateTime <- as.POSIXct(strptime(dat$dateTime, "%d/%m/%Y %H:%M:%S"))
    
    #draw a plot
    png("plot2.png",width = 480, height = 480, units = "px")
    
    plot(dat$dateTime,dat$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
    
    dev.off()
}