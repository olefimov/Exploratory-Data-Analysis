plot1 <- function() {
    #Read data
    data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
    
    #subsetting two days only - 1/2/2007 and 2/2/2007
    dat <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
    
    #draw a histogramme 
    png("plot1.png",width = 480, height = 480, units = "px")
    hist(as.numeric(zz$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
    dev.off()
}