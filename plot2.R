library(data.table)
library(dplyr)

rawData <- data.table(read.table("household_power_consumption.txt", header=T, sep =";",na.strings="?"))
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
subData <- filter(rawData, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
subData$DateTime <- paste(subData$Date, subData$Time)
subData$DateTime <- as.POSIXct(subData$DateTime)

head(subData)

with(subData,{
  plot(Global_active_power~DateTime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
})

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
