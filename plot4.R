dataFile <- "household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
GAP<- as.numeric(subsetData$Global_active_power) #GAP- Global Active Power
GRP <- as.numeric(subsetData$Global_reactive_power) #GRP - Global Reactive Power
voltage <- as.numeric(subsetData$Voltage)
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
EsM1<- as.numeric(subsetData$Sub_metering_1) #EsM Energy sub metering 1
EsM2<- as.numeric(subsetData$Sub_metering_2) #EsM Energy sub metering 2
EsM3<- as.numeric(subsetData$Sub_metering_3) #EsM Energy sub metering 3
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480) 
par(mfrow=c(2,2))
#plot 1
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(datetime, EsM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, EsM2, type="l", col="red")
lines(datetime, EsM3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red","blue"))
#plot 4
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()