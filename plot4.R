# data has been filtered into dates 2007-02-01 and 2007-02-02 using a grep and sed

# read into dataframes
data20070201 <- read.csv("20070201-household_power_consumption.txt", sep = ";")
data20070202 <- read.csv("20070202-household_power_consumption.txt", sep = ";")
dataset <- rbind(data20070201, data20070202)
rm(data20070201, data20070202)

# Create the mfcol
par(mfcol = c(2,2), mar = c(4,4,2,2))

# Plot first graph
plot(dataset$Global_active_power, type = 'l', xlab="", ylab = "Global Active Power (kilowatts)", xaxt = "n")
v1 <- c(0, 1440, 2880)
v2 <- c("Thu", "Fri", "Sat")
axis(side = 1, at = v1, labels = v2)

# Plot second graph
plot(dataset$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering", xaxt = "n")
lines(dataset$Sub_metering_2, type = 'l', col = "red")
lines(dataset$Sub_metering_3, type = 'l', col = "blue")
axis(side = 1, at = v1, labels = v2)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), box.lty = 0, lty = 1, cex = 0.6 )

# Plot third graph
plot(dataset$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = v1, labels = v2)

# Plot fourth graph
plot(dataset$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(side = 1, at = v1, labels = v2)

# Write to PNG
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
