##Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
data$Date <- as.Date(data$Date, format("%d/%m/%Y"))

##Subset data based on specified dates
rdata <- subset(data, Date == "2007-02-02" | Date == "2007-02-01")

##Generate histogram and save it to a png file

png("plot1.png")
hist(as.numeric(rdata$Global_active_power), col = "red",main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", border = " black")
dev.off()


