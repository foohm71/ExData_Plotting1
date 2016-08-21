# data has been filtered into dates 2007-02-01 and 2007-02-02 using a grep and sed

# read into dataframes
data20070201 <- read.csv("20070201-household_power_consumption.txt", sep = ";")
data20070202 <- read.csv("20070202-household_power_consumption.txt", sep = ";")
dataset <- rbind(data20070201, data20070202)
rm(data20070201, data20070202)

# Plot
par(mar = c(5,5,2,1))
hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

# Write to PNG
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()