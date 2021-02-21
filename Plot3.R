library(readr)
library(lubridate)
library(dplyr)
setwd("~/R/Exploratory-Data-Analysis")
unzip("exdata_data_household_power_consumption.zip")
database <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
database <- mutate(database, Datetime = paste(database$Date, database$Time))

database$Datetime <- dmy_hms(database$Datetime)
database$Date <- dmy(database$Date)
        database$Global_active_power <- as.numeric(as.character(database$Global_active_power), accuracy = 0.001)
        database$Global_reactive_power <- as.numeric(as.character(database$Global_reactive_power))
        database$Voltage <- as.numeric(as.character(database$Voltage), accuracy = 0.001)
        database$Global_intensity <- as.numeric(as.character(database$Global_intensity), accuracy = 0.001)
        database$Sub_metering_1 <- as.numeric(as.character(database$Sub_metering_1), accuracy = 0.001)
        database$Sub_metering_2 <- as.numeric(as.character(database$Sub_metering_2), accuracy = 0.001)

database <- subset(database, Date == "2007-2-1" | Date == "2007-2-2")

png(file = "Plot3.png", width = 480, height = 480)

with(database, {
        plot (database$Datetime, database$Sub_metering_1,
              ylab = "Energy sub metering", xlab = "", type = "l")
        lines (database$Datetime, database$Sub_metering_2, col = "red")
        lines (database$Datetime, database$Sub_metering_3, col = "blue")
        legend("topright", lwd = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))})

dev.off()