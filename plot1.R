# Read in data
data <- read.table(file='household_power_consumption.txt',header=TRUE,sep=";",na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors=TRUE)

# Transform date
data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")

# Get first subset
subdata1 <- subset(data, Date >= as.Date(as.character("2007-02-01"),format="%Y-%m-%d"))

# Get second subset
subdata2 <- subset(subdata1, Date <= as.Date(as.character("2007-02-02"),format="%Y-%m-%d"))

# Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))
hist(subdata2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
