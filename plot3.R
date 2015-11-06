# plot3.png

# setwd('/Users/caayala/Dropbox (DESUC)/Documentos/Clases/Exploratory Data Analysis/Course Project 1')

power <- read.csv(file = "household_power_consumption.txt", 
                  sep = ";", na.strings = "?", 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Time <- strptime(paste0(power$Date, " ", power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# head(power)
# str(power)

power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
with(power, plot(Time, Sub_metering_1, 
                 type = "l",
                 col = "black",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
with(power, lines(Time, Sub_metering_2,
                 col = "red"))
with(power, lines(Time, Sub_metering_3, 
                 col = "blue"))
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
