data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", 
                   colClasses = c('character','character','numeric','numeric','numeric','numeric',
                                  'numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

png("plot3.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(data$Global_active_power~data$dateTime,type="l",ylab="Global Active Power",xlab="")

plot(data$Voltage~data$dateTime,type="l",xlab="datetime",ylab="Voltage")

plot(data$Sub_metering_1~data$dateTime, type="l", ylab="Energy sub meeting", xlab="")
points(data$Sub_metering_2~data$dateTime,type="l",col="red")
points(data$Sub_metering_3~data$dateTime,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"))

plot(data$Global_reactive_power~data$dateTime,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()