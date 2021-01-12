# Read data from txt file
nom <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = nom,sep = ";", stringsAsFactors =  FALSE)
# Format variables
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Subset data between 01/02/2007 and 02/02/2007
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Convert Date and Time variables into DateTime
dt <- paste(data2$Date,data2$Time, sep=" ")
data2$DateTime <- strptime(dt,"%Y-%m-%d %H:%M:%S")

# Plot graphic
png(filename = "Plot3.png", width = 480, height= 380)
plot(data2$DateTime,data2$Sub_metering_1,xaxt= 'n',type="l", xlab="", ylab = "Energy sub metering")
lines(data2$DateTime,data2$Sub_metering_1)
lines(data2$DateTime,data2$Sub_metering_2, col="red")
lines(data2$DateTime,data2$Sub_metering_3, col="blue")
axis(1,at=seq(strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S"),strptime("2007-02-02 23:59:00","%Y-%m-%d %H:%M:%S"), length.out = 3),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),x.intersp= 0.5,y.intersp = 0.5, lty=1.5, lwd= 2, col=c("black","red","blue"))
dev.off()

