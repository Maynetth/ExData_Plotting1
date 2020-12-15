HPCFile <- read.table("household_power_consumption.txt", header = T, sep = ";")

HPCFile$Date <- as.Date(HPCFile$Date, format = "%d/%m/%Y")
HPCFile <- subset(HPCFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPCFile$datetime <- strptime(paste(HPCFile$Date, HPCFile$Time), "%Y-%m-%d %H:%M:%S")
Sub_metering_1 <- as.numeric(HPCFile$Sub_metering_1)
Sub_metering_2 <- as.numeric(HPCFile$Sub_metering_2)
Sub_metering_3 <- as.numeric(HPCFile$Sub_metering_3)
HPCFile$datetime <- as.POSIXct(HPCFile$datetime)

plot(HPCFile$datetime, Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(HPCFile$datetime, Sub_metering_2, type = "l", col = "red")
lines(HPCFile$datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
