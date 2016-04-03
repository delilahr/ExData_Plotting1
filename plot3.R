##Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
data$Date <- as.Date(data$Date, format("%d/%m/%Y"))

##Subset data based on specified dates
rdata <- subset(data, Date == "2007-02-02" | Date == "2007-02-01")

##Generate histogram and save it to a png file

png("plot3.png")
plot(as.numeric(rdata$Sub_metering_1, weekdays(rdata$Date)), type = "l"
     , ylab = "Energy sub metering"
     , xlab = ""
     , xaxt="n")
lines(as.numeric(rdata$Sub_metering_2), col = "red")
lines(as.numeric(rdata$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col = c("black","red","blue"), lwd = 1)
axis(1, at = c(0,1250,2500), labels = c("Thu","Fri","Sat"))
dev.off()