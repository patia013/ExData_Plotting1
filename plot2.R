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

# Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))
plot(subdata2$datetime, subdata2$Global_active_power, type='l', main='Global Active Power (kilowatts)', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
