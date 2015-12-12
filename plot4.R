fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("power.zip")){
    download.file(fileUrl, destfile = "power.zip")
}
powerData <- read.table(unzip("power.zip"), header=TRUE, sep = ";", na.strings = "?")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- strptime(paste(powerData$Date,powerData$Time), "%Y-%m-%d %H:%M:%S")
powerData <- subset(powerData, Date == '2007-02-01' | Date == '2007-02-02')

png("plot4.png")

par(mfrow = c(2,2))

##topleft
plot(powerData$Time,powerData$Global_active_power, type = 'l', ylab = "Global Active Power", xlab="")

##topright
plot(powerData$Time, powerData$Voltage, type = 'l', ylab = "Voltage", xlab="datetime")

##bottomleft
plot(powerData$Time, powerData$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab="")
lines(powerData$Time, powerData$Sub_metering_2, col= "red")
lines(powerData$Time, powerData$Sub_metering_3, col= "blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

##bottomright
plot(powerData$Time, powerData$Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab="datetime")


dev.off()