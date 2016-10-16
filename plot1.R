# Author Tim
# 16-10-2016

# read file and select subset
hpc <- read.table("household_power_consumption.txt",sep=";", header = TRUE, nrows = 100000, na.strings = "?")
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
hpc <- hpc[hpc$datetime >= strptime("01/02/2007", "%d/%m/%Y") & hpc$datetime < strptime("03/02/2007", "%d/%m/%Y"),]

# plot1
png(file="plot1.png")
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()