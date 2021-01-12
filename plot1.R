# Read data from txt file
nom <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = nom,sep = ";", stringsAsFactors =  FALSE)
# Format variables
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Subset data between 01/02/2007 and 02/02/2007
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot histogram, with title and red bars
png(filename = "Plot1.png", width = 480, height= 380)
hist(data2$Global_active_power,ylim=c(1,1200), col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

