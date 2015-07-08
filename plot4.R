library (sqldf)
house_power <- read.csv.sql("./household_power_consumption.txt", 
                            sql = "select * from file WHERE Date in ('1/2/2007', '2/2/2007')", 
                            sep=";",
                            header=TRUE)
library(lubridate)
house_power$Date <- dmy(house_power$Date)
house_power$Time <- hms(house_power$Time)
house_power$date_time <- house_power$Date + house_power$Time
png (filename= "plot4.png", width=480, height=480, bg="white")
par(mfrow=c(2,2))
plot (house_power$date_time, house_power$Global_active_power, type="l", xlab="",
      ylab="Global Active Power")
plot (house_power$date_time, house_power$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(house_power$date_time, house_power$Sub_metering_1, type="l", col="black", xlab="",
     ylab="Energy sub metering")
lines(house_power$date_time, house_power$Sub_metering_2, col="red")
lines(house_power$date_time, house_power$Sub_metering_3, col="blue")
legend ("topright", bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
        col=c("black", "red", "blue"))
plot (house_power$date_time, house_power$Global_reactive_power, type="l",
      xlab="datetime", ylab="Global_reactive_power")
dev.off()