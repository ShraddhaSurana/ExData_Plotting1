fileName <- "household_power_consumption.txt"
data <- read.table(fileName,sep=";",header=TRUE, na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dataSubsetted <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataSubsetted$Date), dataSubsetted$Time)
dataSubsetted$Datetime <- as.POSIXct(datetime)

plot(dataSubsetted$Global_active_power~dataSubsetted$Datetime, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()