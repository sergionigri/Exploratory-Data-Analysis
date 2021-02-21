library(readr)
library(lubridate)
setwd("~/R/Exploratory-Data-Analysis")
unzip("exdata_data_household_power_consumption.zip")
database <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
database$Date <- dmy(database$Date)
        database$Global_active_power <- as.numeric(as.character(database$Global_active_power), accuracy = 0.001)
        database$Global_reactive_power <- as.numeric(as.character(database$Global_reactive_power))
        database$Voltage <- as.numeric(as.character(database$Voltage), accuracy = 0.001)
        database$Global_intensity <- as.numeric(as.character(database$Global_intensity), accuracy = 0.001)
        database$Sub_metering_1 <- as.numeric(as.character(database$Sub_metering_1), accuracy = 0.001)
        database$Sub_metering_2 <- as.numeric(as.character(database$Sub_metering_2), accuracy = 0.001)

database <- subset(database, Date == "2007-2-1" | Date == "2007-2-2")

png(file = "Plot1.png", width = 480, height = 480)

with(database, hist(database$Global_active_power, main = "Global Active Power", nclass = 25,
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red", cex.axis=0.9))

dev.off()