# Read in data
data <- read.table(file='household_power_consumption.txt',header=TRUE,sep=";",na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors=TRUE)

# Transform date
data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")

# Get first subset
subdata1 <- subset(data, Date >= as.Date(as.character("2007-02-01"),format="%Y-%m-%d"))

# Get second subset
subdata2 <- subset(subdata1, Date <= as.Date(as.character("2007-02-02"),format="%Y-%m-%d"))

# Combine date and time into single column
subdata2$datetime <- with(subdata2, as.POSIXct(paste(as.character(Date), as.character(Time)), format="%Y-%m-%d %H:%M:%S"))

# Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))
par(mfrow=c(2,2), mar = c(3,4,3,4) + 0.1, oma = c(0,0,0,0))
plot(subdata2$datetime, subdata2$Global_active_power, type='l', xlab='', ylab='Global Active Power')
with(subdata2,plot(datetime, Voltage, type='l'))
with(subdata2,plot(datetime, Sub_metering_1, type='l', col='black', main='', xlab='', ylab='Energy sub metering'))
with(subdata2,lines(datetime, Sub_metering_2, type='l', col='red', main='', xlab='', ylab='Energy sub metering'))
with(subdata2,lines(datetime, Sub_metering_3, type='l', col='blue', main='', xlab='', ylab='Energy sub metering'))
legend("topright", lty=c(1,1,1), lwd=c(2.5,2.5,2.5),c('Sub_metering1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black','red','blue'),  text.font=0.5,cex=0.64)
with(subdata2,plot(datetime,Global_reactive_power, type='l'))
dev.off()
