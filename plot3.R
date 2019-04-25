library(data.table)
library(dplyr)

rawData <- data.table(read.table("household_power_consumption.txt", header=T, sep =";",na.strings="?"))
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
subData <- filter(rawData, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
subData$DateTime <- paste(subData$Date, subData$Time)
subData$DateTime <- as.POSIXct(subData$DateTime)

with(subData,{
  plot(Sub_metering_1~DateTime, type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~DateTime,col="Red")
  lines(Sub_metering_3~DateTime,col="Blue")
})

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
