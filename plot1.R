## read the data in
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#use lubridate to parse the date. Select the data rows containing 
# observations from the two dates of interest.
library(lubridate)
data$Date <- dmy(as.character(data$Date))
d1 <- ymd("2007-02-01")
d2 <- ymd("2007-02-02")
subData <- data[which(data$Date == d1 | data$Date == d2),]

# plot a histogram of Global Active Power.
png(filename = "plot1")
hist(subData$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts",
     ylab = "Frequency")
dev.off()




