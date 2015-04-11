library(dplyr)
library(lubridate)

data <- read.csv("household_power_consumption.txt", sep=";")
data <- mutate(data, Global_active_power = as.numeric(Global_active_power), Date = dmy(Date), DateTime = Date + hms(Time))
data <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"), ]
png("plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1 ~ data$DateTime, type="l", ylab="Energy sub metering")
lines(data$Sub_metering_2 ~ data$DateTime, col="red")
lines(data$Sub_metering_3 ~ data$DateTime, col="blue")
legend('topright', lty=1, col=c('black', 'red', 'blue'), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()