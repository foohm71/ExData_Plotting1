# data has been filtered into dates 2007-02-01 and 2007-02-02 using a grep and sed

# read into dataframes
data20070201 <- read.csv("20070201-household_power_consumption.txt", sep = ";")
data20070202 <- read.csv("20070202-household_power_consumption.txt", sep = ";")
dataset <- rbind(data20070201, data20070202)
rm(data20070201, data20070202)

# Create plot submetering1 without setting x-axis labels
plot(dataset$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering", xaxt = "n")

# Plot submetering2 in red
lines(dataset$Sub_metering_2, type = 'l', col = "red")

# Plot submetering3 in blue
lines(dataset$Sub_metering_3, type = 'l', col = "blue")

# create axis by doing the following:
# (a) as the data points are 1mins apart
# (b) set the tick marks to be 24 x 60 = 1440 apart
v1 <- c(0, 1440, 2880)
v2 <- c("Thu", "Fri", "Sat")
axis(side = 1, at = v1, labels = v2)

# Create Legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8 )

# Write to PNG
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()

