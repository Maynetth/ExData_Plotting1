HPCFile <- read.table("household_power_consumption.txt", header = T, sep = ";")

HPCFile$Date <- as.Date(HPCFile$Date, format = "%d/%m/%Y")
HPCFile <- subset(HPCFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPCFile$datetime <- strptime(paste(HPCFile$Date, HPCFile$Time), "%Y-%m-%d %H:%M:%S")
voltage <- as.numeric(HPCFile$Voltage)
globalActivePower <- as.numeric(HPCFile$Global_active_power)
globalReactivePower <- as.numeric(HPCFile$Global_reactive_power)
Sub_metering_1 <- as.numeric(HPCFile$Sub_metering_1)
Sub_metering_2 <- as.numeric(HPCFile$Sub_metering_2)
Sub_metering_3 <- as.numeric(HPCFile$Sub_metering_3)
HPCFile$datetime <- as.POSIXct(HPCFile$datetime)

par(mfrow = c(2,2))

plot(HPCFile$datetime, globalActivePower, type = "l", xlab = "", ylab= "Global Active Power")

plot(HPCFile$datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(HPCFile$datetime, Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(HPCFile$datetime, Sub_metering_2, type = "l", col = "red")
lines(HPCFile$datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(HPCFile$datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
