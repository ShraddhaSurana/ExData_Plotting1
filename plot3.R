fileName <- "household_power_consumption.txt"
data <- read.table(fileName,sep=";",header=TRUE, na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dataSubsetted <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataSubsetted$Date), dataSubsetted$Time)
dataSubsetted$Datetime <- as.POSIXct(datetime)

plot(dataSubsetted$Sub_metering_1~dataSubsetted$Datetime, type="l", main="", xlab="", ylab="Energy sub metering")
lines(dataSubsetted$Sub_metering_2~dataSubsetted$Datetime,col='Red')
lines(dataSubsetted$Sub_metering_3~dataSubsetted$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()