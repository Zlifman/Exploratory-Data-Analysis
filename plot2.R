data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", 
                   colClasses = c('character','character','numeric','numeric','numeric','numeric',
                                  'numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

png("plot2.png",width = 480, height = 480)
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()