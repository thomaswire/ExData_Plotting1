fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("power.zip")){
    download.file(fileUrl, destfile = "power.zip")
}
powerData <- read.table(unzip("power.zip"), header=TRUE, sep = ";", na.strings = "?")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- strptime(paste(powerData$Date,powerData$Time), "%Y-%m-%d %H:%M:%S")
powerData <- subset(powerData, Date == '2007-02-01' | Date == '2007-02-02')

plot(powerData$Time,powerData$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
