# plot1.png

# setwd('/Users/caayala/Dropbox (DESUC)/Documentos/Clases/Exploratory Data Analysis/Course Project 1')

power <- read.csv(file = "household_power_consumption.txt", 
                    sep = ";", na.strings = "?", 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Time <- strptime(paste0(power$Date, " ", power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# head(power)
# str(power)

power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
plot <- hist(power$Global_active_power, 
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")
dev.off()
