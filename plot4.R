## read the data in
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#use lubridate to parse the date. Select the data rows containing 
# observations from the two dates of interest.Create a new variable, called 
#dt which is a POSIXct date and time stamp. 
library(lubridate)
data$Date <- dmy(as.character(data$Date))
d1 <- ymd("2007-02-01")
d2 <- ymd("2007-02-02")
dataset <- data[which(data$Date == d1 | data$Date == d2),]
dataset$dt <- ymd_hms(paste(dataset$Date, dataset$Time))

#open a png device, and plot 4 graphs in two columns
png(filename = "plot4")
par(mfrow = c(2,2))
# the first plot will be Global Active Power
with (dataset, {
  plot(dt, Global_active_power, type = "l", ylab = "Global active 
       power", xlab = "")
  # the second plot is the voltage
  plot(dt, Voltage, type = "l")
  #the third plot is the Energy sub metering plot
  plot (dt, Sub_metering_1, type = "l", col = "black",
                    ylab = "Energy sub metering", xlab = "")
  points(dataset$dt, dataset$Sub_metering_2, type = "l", col = "red")
  points(dataset$dt, dataset$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # and finally, Global reactive power
  plot(dt, Global_reactive_power, type = "l")
})
dev.off()

