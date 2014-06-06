data<-read.table("household_power_consumption.txt",
                 header=TRUE, sep=";", na.strings = "?")
data$datetime<-as.POSIXct(strptime(paste(data$Date, data$Time),
                                    format="%d/%m/%Y %H:%M:%S"))
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

Sys.setlocale("LC_TIME", "C")

png(filename="plot3.png", width=480, height=480, units="px")

plot(data$datetime, data$Sub_metering_1, type="n",
     ylab="Energy sub metering", 
     xlab="")
     legend(x="topright",
            legend = c("Sub_metering_1",
                       "Sub_metering_2",
                       "Sub_metering_3"),
            lty=c(1,1,1),
            lwd=c(1,1,1),
            col=c("black","blue","red"))            
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")

dev.off()