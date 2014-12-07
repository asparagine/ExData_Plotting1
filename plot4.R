# Read data from household_power_consupmtion.txt
# The text file contains header line, and uses semicolon as separator.
# Specify question mark as na string, and specify all column classes.
# Only the first 2 columns are treated as character, 
# and the left ones are all numeric values.
data <- read.table("../R/household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = c("character", "character", 
                        "numeric", "numeric", "numeric", "numeric", "numeric", 
                        "numeric", "numeric"))
# Only extract data which its date is 2007-02-01 or 2007-02-02.
subData = data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Set graphics device as png file.
# To match with the sample output, set file width and height as 504,
# and the background as transparent mode.
png(filename = "plot4.png", width = 504, height = 504, bg = "transparent")
# To correctly output the weekday's string, set locale as English.
Sys.setlocale("LC_TIME", "English")
# Get data's DateTime value by append data's Date and Time value,
# and parse it by strptime.
subData$DateTime <- strptime(paste(subData$Date, subData$Time, sep = " "), 
                             "%d/%m/%Y %H:%M:%S")

# Set the plot to split 2 by 2.
par(mfcol=c(2,2))

# Plot the first scatter plot.
plot(subData$DateTime, subData$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

# Plot the second scatter plot's first data set.
plot(subData$DateTime, subData$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
# Plot the second scatter plot's second data set.
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
# Plot the second scatter plot's third data set.
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
# Set the second scatter plot's legend.
# Set the bty as "n" to remove the border line on legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

# Plot the third scatter plot.
plot(subData$DateTime, subData$Voltage, xlab="datetime", ylab="Voltage", type="l")

# Plot the fourth scatter plot.
plot(subData$DateTime, subData$Global_reactive_power, 
     xlab="datetime", ylab="Global_reactive_power", type="l")

# Close the device
dev.off()