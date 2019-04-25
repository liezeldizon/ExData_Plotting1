library(data.table)
library(dplyr)

rawData <- data.table(read.table("household_power_consumption.txt", header=T, sep =";",na.strings="?"))
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
subData <- filter(rawData, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

hist(subData$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab="Frequency"
     ,main="Global Active Power")

dev.copy(png,"plot1.png", width=480, height=480)
#dev.off()