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

#open a png device, and plot Global Active Power versus date/time
png(filename = "plot2.png")
plot(dataset$dt, dataset$Global_active_power, type = "l",
     ylab = "Global active power (kilowatts)", xlab = "")
dev.off()

