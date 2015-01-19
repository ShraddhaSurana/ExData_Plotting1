fileName <- "household_power_consumption.txt"
data <- read.table(fileName,sep=";",header=TRUE, na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dataSubsetted <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataSubsetted$Date), dataSubsetted$Time)
dataSubsetted$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), oma=c(0,0,2,0))
plot(dataSubsetted$Global_active_power~dataSubsetted$Datetime, type="l", main="", xlab="", ylab="Global Active Power")
plot(dataSubsetted$Voltage~dataSubsetted$Datetime, type="l", main="", xlab="datetime", ylab="Voltage")
plot(dataSubsetted$Sub_metering_1~dataSubsetted$Datetime, type="l", main="", xlab="", ylab="Energy sub metering")
lines(dataSubsetted$Sub_metering_2~dataSubsetted$Datetime,col='Red')
lines(dataSubsetted$Sub_metering_3~dataSubsetted$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex = 0.5,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataSubsetted$Global_reactive_power~dataSubsetted$Datetime, type="l", main="", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
