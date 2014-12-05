data <- read.table('household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=TRUE)
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
data$DateTime <- paste(as.character(data$Date),as.character(data$Time),sep=' ')
filteredData1 <- subset(data,as.Date(Date) == '2007-02-01')
filteredData2 <- subset(data,as.Date(Date) == '2007-02-02')
combinedData <- rbind(filteredData1,filteredData2)
# First plot
plot(strptime(combinedData$DateTime,format="%Y-%m-%d %H:%M:%S"),type="l",as.numeric(as.character(combinedData$Global_active_power)),xlab="",ylab="Global Active Power (kilowatts)")
# Second plot
plot(strptime(combinedData$DateTime,format="%Y-%m-%d %H:%M:%S"),type="l",as.numeric(as.character(combinedData$Voltage)),xlab="",ylab="Voltage")
# Third plot
plot(strptime(combinedData$DateTime,format="%Y-%m-%d %H:%M:%S"),as.numeric(combinedData$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(strptime(combinedData$DateTime,format="%Y-%m-%d %H:%M:%S"),as.numeric(combinedData$Sub_metering_2),type="l",col="red")
lines(strptime(combinedData$DateTime,format="%Y-%m-%d %H:%M:%S"),as.numeric(combinedData$Sub_metering_3),type="l",col="blue")
# Fourth plot
plot(strptime(combinedData$DateTime,format="%Y-%m-%d %H:%M:%S"),type="l",as.numeric(as.character(combinedData$Global_reactive_power)),xlab="datetime",ylab="Global_reactive_power")
