# Read data from txt file
nom <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = nom,sep = ";", stringsAsFactors =  FALSE)
# Format variables
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Subset data between 01/02/2007 and 02/02/2007
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Convert Date and Time variables into DateTime
dt <- paste(data2$Date,data2$Time, sep=" ")
data2$DateTime <- strptime(dt,"%Y-%m-%d %H:%M:%S")

# Plot graphic
png(filename = "Plot2.png", width = 480, height= 380)
plot(data2$DateTime,data2$Global_active_power, xaxt= 'n',type="l", xlab="", ylab = "Global Active Power (kilowatts)")
axis(1,at=seq(strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S"),strptime("2007-02-02 23:59:00","%Y-%m-%d %H:%M:%S"), length.out = 3),labels=c("Thu","Fri","Sat"))
dev.off()

