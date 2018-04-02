dataFile <- "household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
EsM1<- as.numeric(subsetData$Sub_metering_1)
EsM2<- as.numeric(subsetData$Sub_metering_2) 
EsM3<- as.numeric(subsetData$Sub_metering_3) #EsM Energy sub metering
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480) 
plot(datetime, EsM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, EsM2, type="l", col="red")
lines(datetime, EsM3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red","blue"))
dev.off()