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
png(filename = "plot1.png", width = 504, height = 504, bg = "transparent")
# To correctly output the weekday's string, set locale as English.
Sys.setlocale("LC_TIME", "English")
# Plot the histogram, and set the title by main,
# and set the x-axis label by xlab, and the bar color by col.
hist(subData$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")
# Close the device.
dev.off()