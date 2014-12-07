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
png(filename = "plot3.png", width = 504, height = 504, bg = "transparent")
# To correctly output the weekday's string, set locale as English.
Sys.setlocale("LC_TIME", "English")
# Get data's DateTime value by append data's Date and Time value,
# and parse it by strptime.
subData$DateTime <- strptime(paste(subData$Date, subData$Time, sep = " "), 
                             "%d/%m/%Y %H:%M:%S")
# First plot the sub_metering_1's scatter plot.
plot(subData$DateTime, subData$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
# Then add sub_metering_2's points with red color.
points(subData$DateTime, subData$Sub_metering_2, type = "l", col = "red")
# Then add sub_metering_3's points with blue color.
points(subData$DateTime, subData$Sub_metering_3, type = "l", col = "blue")
# Finally add the legend on topright, and set the legend names and colors,
# and set the line type legend at the end by lty.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1))
# Close the device.
dev.off()