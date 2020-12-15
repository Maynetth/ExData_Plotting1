HPCFile <- read.table("household_power_consumption.txt", header = T, sep = ";")

HPCFile$Date <- as.Date(HPCFile$Date, format = "%d/%m/%Y")
HPCFile <- subset(HPCFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPCFile$datetime <- strptime(paste(HPCFile$Date, HPCFile$Time), "%Y-%m-%d %H:%M:%S")

HPCFile$datetime <- as.POSIXct(HPCFile$datetime)
plot(HPCFile$Global_active_power ~ HPCFile$datetime, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
