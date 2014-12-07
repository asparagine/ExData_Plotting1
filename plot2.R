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
# To match with the sample output, set file width and height as 480,
# and the background as transparent mode.
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
# To correctly output the weekday's string, set locale as English.
Sys.setlocale("LC_TIME", "English")
# Get data's DateTime value by append data's Date and Time value,
# and parse it by strptime.
subData$DateTime <- strptime(paste(subData$Date, subData$Time, sep = " "), 
                             "%d/%m/%Y %H:%M:%S")
# Plot the scatter plot, and set type to "l" to draw the line instead of point.
plot(subData$DateTime, subData$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
# Close the device.
dev.off()