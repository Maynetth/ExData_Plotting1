HPCFile <- read.table("household_power_consumption.txt", header = T, sep = ";")

HPCFile$Date <- as.Date(HPCFile$Date, format = "%d/%m/%Y")
HPCFile <- subset(HPCFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPCFile$datetime <- strptime(paste(HPCFile$Date, HPCFile$Time), "%Y-%m-%d %H:%M:%S")

globalActivePower <- as.numeric(HPCFile$Global_active_power)
hist(globalActivePower, main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()