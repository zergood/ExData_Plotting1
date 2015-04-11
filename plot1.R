library(dplyr)
library(lubridate)

data <- read.csv("household_power_consumption.txt", sep=";")
data <- mutate(data, Global_active_power = as.numeric(Global_active_power), Date = dmy(Date))
data <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"), ]
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()