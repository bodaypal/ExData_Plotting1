data<-read.table("household_power_consumption.txt",
                 header=TRUE, sep=";", na.strings = "?")
data$datetime<-as.POSIXct(strptime(paste(data$Date, data$Time),
                                    format="%d/%m/%Y %H:%M:%S"))
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

Sys.setlocale("LC_TIME", "C")

png(filename="plot1.png", width=480, height=480, units="px")

hist(data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()