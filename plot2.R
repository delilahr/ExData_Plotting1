##Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
data$Date <- as.Date(data$Date, format("%d/%m/%Y"))

##Subset data based on specified dates
rdata <- subset(data, Date == "2007-02-02" | Date == "2007-02-01")

##Generate histogram and save it to a png file

png("plot2.png")
plot(as.numeric(rdata$Global_active_power,weekdays(rdata$Date)), type = "l"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = ""
     , xaxt="n")
axis(1, at = c(0,1250,2500), labels = c("Thu","Fri","Sat"))
dev.off()