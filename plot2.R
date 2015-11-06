# plot2.png

# setwd('/Users/caayala/Dropbox (DESUC)/Documentos/Clases/Exploratory Data Analysis/Course Project 1')

power <- read.csv(file = "household_power_consumption.txt", 
                  sep = ";", na.strings = "?", 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Time <- strptime(paste0(power$Date, " ", power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# head(power)
# str(power)

power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
plot <- with(power, plot(Time, Global_active_power, 
                         type = "l",
                         main = "Global Active Power",
                         col = "black",
                         xlab = "",
                         ylab = "Global Active Power (kilowatts)"))
dev.off()
