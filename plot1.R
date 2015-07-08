library (sqldf)
house_power <- read.csv.sql("./household_power_consumption.txt", 
                            sql = "select * from file WHERE Date in ('1/2/2007', '2/2/2007')", 
                            sep=";",
                            header=TRUE)
png (filename= "plot1.png", width=480, height=480, bg="white")
hist (house_power$Global_active_power, main= "Global Active Power", col="red", xlab="Global Active Power (kilowatts",
      ylab="Frequency")
dev.off()