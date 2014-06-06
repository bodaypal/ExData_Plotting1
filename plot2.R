data<-read.table("household_power_consumption.txt",
                 header=TRUE, sep=";", na.strings = "?")
data$datetime<-as.POSIXct(strptime(paste(data$Date, data$Time),
                                    format="%d/%m/%Y %H:%M:%S"))
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

Sys.setlocale("LC_TIME", "C")

png(filename="plot2.png", width=480, height=480, units="px")

plot(data$datetime, data$Global_active_power,
     ylab="Global Active Power (kilowatts)", 
     xlab="", type="n")
lines(data$datetime, data$Global_active_power)


dev.off()