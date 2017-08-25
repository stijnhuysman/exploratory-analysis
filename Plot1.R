## Complete dataset
data_complete <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")

## data subset
data <- subset(data_complete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_complete)

## data posix
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()