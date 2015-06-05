plot4 <- function() {
    #Read data
    data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
    
    #subsetting two days only - 1/2/2007 and 2/2/2007
    dat <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
    
    #merging date and time and adding it as a new column to dataframe
    dat$dateTime <- paste(dat$Date,dat$Time)
    
    #convert dateTime to POSIX
    dat$dateTime <- as.POSIXct(strptime(dat$dateTime, "%d/%m/%Y %H:%M:%S"))
    
    #create a png file device
    png("plot4.png",width = 480, height = 480, units = "px")
    
    #set two rows and two columns for drawings
    par(mfrow=c(2,2))
    
    #drawing 1st graph
    plot(dat$dateTime,dat$Global_active_power,xlab="",ylab="Global Active Power",type="l")
    
    #drawing 2nd graph
    plot(dat$dateTime,dat$Voltage,xlab="datetime",ylab="Voltage",type="l")
    
    #drawing a 3rd graph
    plot(dat$dateTime,dat$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
    
    #adding second graphics to a plot
    points(dat$dateTime,dat$Sub_metering_2,type="l",col="red")
    
    #adding third graphic to a plot
    points(dat$dateTime,dat$Sub_metering_3,type="l",col="blue")
    
    #add legend in top right position
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=c(1,1,1),col=c("black","red","blue"), lwd=c(2,2,2), bty="n")
    
    #drawing 4th graph
    plot(dat$dateTime,dat$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
    
    dev.off()
}