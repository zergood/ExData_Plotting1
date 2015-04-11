library(dplyr)
library(lubridate)

data <- read.csv("household_power_consumption.txt", sep=";")
data <- mutate(data, Global_active_power = as.numeric(Global_active_power), Date = dmy(Date), DateTime = Date + hms(Time))
data <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"), ]
png("plot2.png", width = 480, height = 480)
plot(data$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
