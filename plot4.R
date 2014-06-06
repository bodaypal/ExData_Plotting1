data<-read.table("household_power_consumption.txt",
                 header=TRUE, sep=";", na.strings = "?")
data$datetime<-as.POSIXct(strptime(paste(data$Date, data$Time),
                                   format="%d/%m/%Y %H:%M:%S"))
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

Sys.setlocale("LC_TIME", "C")

png(filename="plot4.png", width=480, height=480, units="px")

par(mfcol= c(2,2))

## top left

plot(data$datetime, data$Global_active_power,
     ylab="Global Active Power", 
     xlab="", type="n")
lines(data$datetime, data$Global_active_power)

## bottom left
plot(data$datetime, data$Sub_metering_1, type="n",
     ylab="Energy sub metering", 
     xlab="")
legend(x="topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black","blue","red"),
       bty="n")
              
       lines(data$datetime, data$Sub_metering_1)
       lines(data$datetime, data$Sub_metering_2, col="red")
       lines(data$datetime, data$Sub_metering_3, col="blue")

## top right       

plot(data$datetime, data$Voltage,  
     xlab="datetime", ylab="Voltage",
     type="n")
lines(data$datetime, data$Voltage)

## bottom right

plot(data$datetime, data$Global_reactive_power,  
     xlab="datetime", ylab="Global_reactive_power",
     type="n")
lines(data$datetime, data$Global_reactive_power)

dev.off()
